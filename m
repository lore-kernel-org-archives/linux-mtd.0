Received: from rcdn-iport-6.cisco.com ([173.37.86.77])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMJzs-0004ye-0D
 for linux-mtd@lists.infradead.org; Mon, 12 Nov 2018 21:43:52 +0000
Date: Mon, 12 Nov 2018 13:43:33 -0800
From: Daniel Walker <danielwa@cisco.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: "Nikunj Kela (nkela)" <nkela@cisco.com>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
Subject: Re: [PATCH] jffs2: implement mount option to configure endianness
Message-ID: <20181112214333.lplffcc722hta43v@zorba>
References: <20181106214928.40020-1-nkela@cisco.com>
 <921b0f78cf67d7307a0555e1fd6f2c2976310adc.camel@infradead.org>
 <591D4732-BC3E-4F85-9277-25E049FFF4BA@cisco.com>
 <CAFLxGvz8QgK1P6d-_biSRk4fyYEobio315_tUP+cRXTvt+m1hA@mail.gmail.com>
 <01b82f6eb37b674effc6c8b0fa4a014deb401a85.camel@infradead.org>
 <B1D7CC34-C9D3-4745-94A1-3F713C1CB216@cisco.com>
 <897867ec09af82ca76c642b48ad23a7f08838dcf.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <897867ec09af82ca76c642b48ad23a7f08838dcf.camel@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 08, 2018 at 07:47:08PM +0000, David Woodhouse wrote:
> On Thu, 2018-11-08 at 18:01 +0000, Nikunj Kela (nkela) wrote:
> >     But we can hypothesise and handwave about it until the cows come home;
> >     I'd like to see a real test of whether it actually makes a difference
> >     that we care about.
> >     
> >     If it does, one option might be to just build separate versions of
> >     scan.c for each endianness, since that's the critical path we care
> >     about.
> > 
> > I wonder if this feature is really that important that we need to duplicate the drivers.
> > Also, it might take some time for me to find some device that I can run the tests with and without this patch.
> 
> Hm?
> 
> # modprobe mtdram size=16384
> # mount -tjffs2 mtd0 /mnt
> # cp -av .git /mnt # until it fills up
> # umount /mnt
> # perf record mount -tjffs2 mtd0 /mnt
> 
> On my desktop 'perf' only gets about 12 samples from that, so it's not
> ideal. But you can make the mtdram device bigger, use something other
> than my shiny new laptop, and use a higher sample frequency from 'perf'
> and you should be able to get some vaguely meaningful results.
> 

10 meg MTDRAM device baseline without any changes,

sh-4.2# perf stat -B  mount -tjffs2 /dev/mtdblock7 /mnt
jffs2: Flash size not aligned to erasesize, reducing to 9920KiB

 Performance counter stats for 'mount -tjffs2 /dev/mtdblock7 /mnt':

         74.922624 task-clock                #    0.820 CPUs utilized          
                14 context-switches          #    0.187 K/sec                  
                 0 cpu-migrations            #    0.000 K/sec                  
                94 page-faults               #    0.001 M/sec                  
         103274114 cycles                    #    1.378 GHz                     [ 6.65%]
           1887555 stalled-cycles-frontend   #    1.83% frontend cycles idle   
           1688520 stalled-cycles-backend    #    1.63% backend  cycles idle   
         106423876 instructions              #    1.03  insns per cycle        
                                             #    0.02  stalled cycles per insn
          21325416 branches                  #  284.633 M/sec                   [97.41%]
            104797 branch-misses             #    0.49% of all branches         [95.20%]

       0.091398368 seconds time elapsed


Same partition size, adding in the patch from Nikunj set to Native,

sh-4.2# perf stat -B mount -t jffs2 /dev/mtdblock7 /mnt
jffs2: Flash size not aligned to erasesize, reducing to 9920KiB

 Performance counter stats for 'mount -t jffs2 /dev/mtdblock7 /mnt':

         75.223488 task-clock                #    0.736 CPUs utilized          
                17 context-switches          #    0.226 K/sec                  
                 0 cpu-migrations            #    0.000 K/sec                  
                94 page-faults               #    0.001 M/sec                  
         100815917 cycles                    #    1.340 GHz                    
          16561335 stalled-cycles-frontend   #   16.43% frontend cycles idle   
           2991700 stalled-cycles-backend    #    2.97% backend  cycles idle   
         106536662 instructions              #    1.06  insns per cycle        
                                             #    0.16  stalled cycles per insn
          10931326 branches                  #  145.318 M/sec                   [ 4.13%]
            931410 branch-misses             #    8.52% of all branches         [ 2.87%]

       0.102157784 seconds time elapsed


I'm not sure this tells us very much. If anything it looks like not much has changes.

Daniel
