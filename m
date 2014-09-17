Date: Wed, 17 Sep 2014 17:41:54 -0400 (EDT)
From: Rodrigo Freire <rfreire@redhat.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Message-ID: <86761077.40163293.1410990114756.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAAEAJfDAG8KrPKqVC5NujGnbSyxmrAtFcLvhScYsNm8RT59Gnw@mail.gmail.com>
References: <371358190.34795877.1410204429882.JavaMail.zimbra@redhat.com>
 <1444809468.34812041.1410206680931.JavaMail.zimbra@redhat.com>
 <20140909170231.GA14429@logfs.org>
 <1807144344.40128259.1410985683342.JavaMail.zimbra@redhat.com>
 <CAAEAJfDAG8KrPKqVC5NujGnbSyxmrAtFcLvhScYsNm8RT59Gnw@mail.gmail.com>
Subject: Re: [PATCH V2] mtd: block2mtd: Present block2mtd timely on boot time
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: Felix Fietkau <nbd@openwrt.org>,
 =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
 Herton Krzesinski <hkrzesin@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Holas Ezequiel,

----- Original Message ----- 
From: "Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar> 
> On 17 September 2014 21:28, Rodrigo Freire <rfreire@redhat.com> wrote: 
> 
> Using block2mtd sounds a bit unusual. I see that you are trying to get 
> a more robust fs.... have you tried using f2fs instead of jffs2? 

I see that it is still marked as Experimental as of latest (3.17-RC5)
kernel. But will take a look in the future, thanks for pointing.


> > Currently, a block MTD device is not presented to the system on time, in 
> > order to start mounting the filesystems. This patch ensures that block2mtd 
> > is presented at the right time, so filesystems can be mounted on boot time. 
> 
> It worries me a bit to add such a long delay to the boot. If for some 
> reason the SD is not working, then the kernel will wait (by default) 3 
> seconds now? 

Not really; see the decision path:
IF block2mtd is not a module (is builtin), AND
   IF there is a valid block2mtd= clause on kernel cmdline, AND
      IF the device specified device on block2mtd= clause is still not present
      THEN wait *up to* 3 seconds (or seconds=n if specified on block2mtd=
           cmdline) to the device to show up. If the device shows up earlier,
           the device is created and boot proceeds.
      ELSE Fail to create the block2mtd device.
ELSE keep booting the kernel normally, without any further delays.

Best regards,

- RF.
