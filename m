Received: from alln-iport-1.cisco.com ([173.37.142.88])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMLoq-0006GF-4E
 for linux-mtd@lists.infradead.org; Mon, 12 Nov 2018 23:40:36 +0000
Date: Mon, 12 Nov 2018 15:40:22 -0800
From: Daniel Walker <danielwa@cisco.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: "Nikunj Kela (nkela)" <nkela@cisco.com>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
Subject: Re: [PATCH] jffs2: implement mount option to configure endianness
Message-ID: <20181112234022.r3gyu633ln3bp774@zorba>
References: <20181106214928.40020-1-nkela@cisco.com>
 <921b0f78cf67d7307a0555e1fd6f2c2976310adc.camel@infradead.org>
 <591D4732-BC3E-4F85-9277-25E049FFF4BA@cisco.com>
 <CAFLxGvz8QgK1P6d-_biSRk4fyYEobio315_tUP+cRXTvt+m1hA@mail.gmail.com>
 <01b82f6eb37b674effc6c8b0fa4a014deb401a85.camel@infradead.org>
 <B1D7CC34-C9D3-4745-94A1-3F713C1CB216@cisco.com>
 <897867ec09af82ca76c642b48ad23a7f08838dcf.camel@infradead.org>
 <20181112214333.lplffcc722hta43v@zorba>
 <20181112225015.jyuro3z3ygavnvrp@zorba>
 <f64aa222a15467dc667deb5fc1bbcae1e477482a.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f64aa222a15467dc667deb5fc1bbcae1e477482a.camel@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 12, 2018 at 03:11:32PM -0800, David Woodhouse wrote:
> On Mon, 2018-11-12 at 14:50 -0800, Daniel Walker wrote:
> >  Performance counter stats for 'mount -t jffs2 /dev/mtdblock7 /mnt':
> 
> Hm, how many decades will it take for the 'mtdblock' thing to die?
> JFFS2 doesn't use block devices :)

mount wouldn't mount unless I use it. It complained "not a block device."

sh-4.2# mount -t jffs2 /dev/mtd7 /mnt
mount:  /dev/mtd7 is not a block device

> > It looks like the took slightly more than twice as long to mount.
> 
> Assuming that's repeatable, it seems moderately suboptimal.

I don't understand how the cycles are lower, but the time is longer. I suppose
it could be measuring the time including when another process was running and
mount as waiting.. 

Looks like it's not repeatable .. Another run and the time is similar to the
baseline.

sh-4.2# perf stat -B mount -t jffs2 /dev/mtdblock7 /mnt
jffs2: Flash size not aligned to erasesize, reducing to 99944KiB

 Performance counter stats for 'mount -t jffs2 /dev/mtdblock7 /mnt':

        100.468768 task-clock                #    0.750 CPUs utilized
                14 context-switches          #    0.139 K/sec
                 0 cpu-migrations            #    0.000 K/sec
                94 page-faults               #    0.936 K/sec
         132105969 cycles                    #    1.315 GHz                     [94.26%]
          27915494 stalled-cycles-frontend   #   21.13% frontend cycles idle    [91.88%]
          10214813 stalled-cycles-backend    #    7.73% backend  cycles idle    [92.04%]
         137814560 instructions              #    1.04  insns per cycle
                                             #    0.20  stalled cycles per insn [92.04%]
          15395620 branches                  #  153.238 M/sec                   [19.29%]
           1240507 branch-misses             #    8.06% of all branches         [17.87%]

       0.133987804 seconds time elapsed



Should I test increasing the mtdram size ?

Daniel
