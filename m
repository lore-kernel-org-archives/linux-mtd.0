Received: from rcdn-iport-1.cisco.com ([173.37.86.72])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gML2N-0001qV-5x
 for linux-mtd@lists.infradead.org; Mon, 12 Nov 2018 22:50:33 +0000
Date: Mon, 12 Nov 2018 14:50:15 -0800
From: Daniel Walker <danielwa@cisco.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: "Nikunj Kela (nkela)" <nkela@cisco.com>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
Subject: Re: [PATCH] jffs2: implement mount option to configure endianness
Message-ID: <20181112225015.jyuro3z3ygavnvrp@zorba>
References: <20181106214928.40020-1-nkela@cisco.com>
 <921b0f78cf67d7307a0555e1fd6f2c2976310adc.camel@infradead.org>
 <591D4732-BC3E-4F85-9277-25E049FFF4BA@cisco.com>
 <CAFLxGvz8QgK1P6d-_biSRk4fyYEobio315_tUP+cRXTvt+m1hA@mail.gmail.com>
 <01b82f6eb37b674effc6c8b0fa4a014deb401a85.camel@infradead.org>
 <B1D7CC34-C9D3-4745-94A1-3F713C1CB216@cisco.com>
 <897867ec09af82ca76c642b48ad23a7f08838dcf.camel@infradead.org>
 <20181112214333.lplffcc722hta43v@zorba>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181112214333.lplffcc722hta43v@zorba>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 12, 2018 at 01:43:33PM -0800, Daniel Walker wrote:
> On Thu, Nov 08, 2018 at 07:47:08PM +0000, David Woodhouse wrote:
> > On Thu, 2018-11-08 at 18:01 +0000, Nikunj Kela (nkela) wrote:
> > >     But we can hypothesise and handwave about it until the cows come home;
> > >     I'd like to see a real test of whether it actually makes a difference
> > >     that we care about.
> > >     
> > >     If it does, one option might be to just build separate versions of
> > >     scan.c for each endianness, since that's the critical path we care
> > >     about.
> > > 
> > > I wonder if this feature is really that important that we need to duplicate the drivers.
> > > Also, it might take some time for me to find some device that I can run the tests with and without this patch.
> > 
> > Hm?
> > 
> > # modprobe mtdram size=16384
> > # mount -tjffs2 mtd0 /mnt
> > # cp -av .git /mnt # until it fills up
> > # umount /mnt
> > # perf record mount -tjffs2 mtd0 /mnt
> > 
> > On my desktop 'perf' only gets about 12 samples from that, so it's not
> > ideal. But you can make the mtdram device bigger, use something other
> > than my shiny new laptop, and use a higher sample frequency from 'perf'
> > and you should be able to get some vaguely meaningful results.
> > 
> 

Made a little mistake. The first tests were with Nikunj's very first version
which was just a pure Kconfig option. I reran the test of the second version and
increased the mtdram space to 100megs.

baseline below,

sh-4.2# perf stat -B mount -t jffs2 /dev/mtdblock7 /mnt
jffs2: Flash size not aligned to erasesize, reducing to 99944KiB

 Performance counter stats for 'mount -t jffs2 /dev/mtdblock7 /mnt':

        100.303072 task-clock                #    0.775 CPUs utilized          
                19 context-switches          #    0.189 K/sec                  
                 0 cpu-migrations            #    0.000 K/sec                  
                94 page-faults               #    0.937 K/sec                  
         134135872 cycles                    #    1.337 GHz                     [92.88%]
          29217497 stalled-cycles-frontend   #   21.78% frontend cycles idle    [92.02%]
          10493221 stalled-cycles-backend    #    7.82% backend  cycles idle    [92.05%]
         136740541 instructions              #    1.02  insns per cycle        
                                             #    0.21  stalled cycles per insn [92.04%]
          14639149 branches                  #  145.949 M/sec                   [19.06%]
           1384856 branch-misses             #    9.46% of all branches         [16.29%]

       0.129377322 seconds time elapsed


This is with the mount option changes added.


sh-4.2# perf stat -B mount -t jffs2 /dev/mtdblock7 /mnt
jffs2: Flash size not aligned to erasesize, reducing to 99944KiB

 Performance counter stats for 'mount -t jffs2 /dev/mtdblock7 /mnt':

        100.516160 task-clock                #    0.315 CPUs utilized          
                14 context-switches          #    0.139 K/sec                  
                 0 cpu-migrations            #    0.000 K/sec                  
                94 page-faults               #    0.935 K/sec                  
         129255757 cycles                    #    1.286 GHz                     [19.32%]
          26930446 stalled-cycles-frontend   #   20.84% frontend cycles idle    [92.00%]
          10068627 stalled-cycles-backend    #    7.79% backend  cycles idle    [92.05%]
         138000320 instructions              #    1.07  insns per cycle        
                                             #    0.20  stalled cycles per insn [92.04%]
          26158985 branches                  #  260.247 M/sec                   [90.09%]
           1242606 branch-misses             #    4.75% of all branches         [19.24%]

       0.319593555 seconds time elapsed


It looks like the took slightly more than twice as long to mount.

Daniel
