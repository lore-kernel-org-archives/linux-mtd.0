Received: from alln-iport-6.cisco.com ([173.37.142.93])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMfob-0000oY-FU
 for linux-mtd@lists.infradead.org; Tue, 13 Nov 2018 21:01:42 +0000
Date: Tue, 13 Nov 2018 13:01:26 -0800
From: Daniel Walker <danielwa@cisco.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: "Nikunj Kela (nkela)" <nkela@cisco.com>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
Subject: Re: [PATCH] jffs2: implement mount option to configure endianness
Message-ID: <20181113210126.7cupw5gt3vpnyotq@zorba>
References: <591D4732-BC3E-4F85-9277-25E049FFF4BA@cisco.com>
 <CAFLxGvz8QgK1P6d-_biSRk4fyYEobio315_tUP+cRXTvt+m1hA@mail.gmail.com>
 <01b82f6eb37b674effc6c8b0fa4a014deb401a85.camel@infradead.org>
 <B1D7CC34-C9D3-4745-94A1-3F713C1CB216@cisco.com>
 <897867ec09af82ca76c642b48ad23a7f08838dcf.camel@infradead.org>
 <20181112214333.lplffcc722hta43v@zorba>
 <20181112225015.jyuro3z3ygavnvrp@zorba>
 <f64aa222a15467dc667deb5fc1bbcae1e477482a.camel@infradead.org>
 <20181112234022.r3gyu633ln3bp774@zorba>
 <b797e897960c3c047dfc7874615358a5443038a8.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b797e897960c3c047dfc7874615358a5443038a8.camel@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 12, 2018 at 03:43:37PM -0800, David Woodhouse wrote:
> 
> That can't hurt. We should probably look at the time elapsed before you
> can *write* to it (when the background scan and crc checking is
> complete) rather than just reading.
> 


Here are more data points. This is again with 100meg mtdram size. I made a 
script which does the mount and umount, then perf ran that 100 times over and
averaged the results.

Baseline,

 Performance counter stats for 'bash test.sh' (100 runs):

        111.414863 task-clock                #    0.637 CPUs utilized            ( +-  0.07% )
                41 context-switches          #    0.371 K/sec                    ( +-  0.50% )
                 3 cpu-migrations            #    0.023 K/sec                    ( +-  2.44% )
               405 page-faults               #    0.004 M/sec                    ( +-  0.05% )
         147235193 cycles                    #    1.322 GHz                      ( +-  0.47% ) [53.76%]
          53688988 stalled-cycles-frontend   #   36.46% frontend cycles idle     ( +-  2.59% ) [45.13%]
          21691444 stalled-cycles-backend    #   14.73% backend  cycles idle     ( +-  5.81% ) [68.50%]
         138433181 instructions              #    0.94  insns per cycle
                                             #    0.39  stalled cycles per insn  ( +-  0.88% ) [88.11%]
          25882823 branches                  #  232.310 M/sec                    ( +-  1.42% ) [85.33%]
            644457 branch-misses             #    2.49% of all branches          ( +-  5.19% ) [74.30%]

       0.175012976 seconds time elapsed                                          ( +-  0.58% )


With Nikunj's patch,


 Performance counter stats for 'bash test.sh' (100 runs):

        110.436715 task-clock                #    0.625 CPUs utilized            ( +-  0.07% )
                41 context-switches          #    0.373 K/sec                    ( +-  0.58% )
                 3 cpu-migrations            #    0.024 K/sec                    ( +-  2.18% )
               405 page-faults               #    0.004 M/sec                    ( +-  0.05% )
         145964351 cycles                    #    1.322 GHz                      ( +-  0.49% ) [53.68%]
          47504491 stalled-cycles-frontend   #   32.55% frontend cycles idle     ( +-  2.96% ) [55.47%]
          20481138 stalled-cycles-backend    #   14.03% backend  cycles idle     ( +-  6.18% ) [71.19%]
         134947645 instructions              #    0.92  insns per cycle
                                             #    0.35  stalled cycles per insn  ( +-  1.18% ) [82.19%]
          25343960 branches                  #  229.489 M/sec                    ( +-  1.65% ) [82.50%]
            693642 branch-misses             #    2.74% of all branches          ( +-  5.29% ) [70.06%]

       0.176606850 seconds time elapsed                                          ( +-  0.50% )



This seems to show an 0.91% speed elapsed time difference. Most of the rest of it seems very similar.


Daniel
