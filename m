Received: from mail-vn0-x232.google.com ([2607:f8b0:400c:c0f::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z6Div-0003I7-0r
 for linux-mtd@lists.infradead.org; Sat, 20 Jun 2015 08:01:57 +0000
Received: by vnbf7 with SMTP id f7so941590vnb.6
 for <linux-mtd@lists.infradead.org>; Sat, 20 Jun 2015 01:01:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAC7eWMWXxbSL+WG_vHFg-DtApitTHx+-A5aarfcNeAJSWY+kJg@mail.gmail.com>
References: <CAC7eWMWXxbSL+WG_vHFg-DtApitTHx+-A5aarfcNeAJSWY+kJg@mail.gmail.com>
Date: Sat, 20 Jun 2015 10:01:33 +0200
Message-ID: <CAFLxGvy7cmbDR3zo2H-sbBuJx1W4jN+4U_CZAgHonnEq7cMHDg@mail.gmail.com>
Subject: Re: Two ubifs errors
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Smitha Rathnam <rathnam.smitha@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jun 20, 2015 at 12:50 AM, Smitha Rathnam
<rathnam.smitha@gmail.com> wrote:
> Hi All,
>
> I posted a similar problem earlier. This time my question is slightly different.
> First: We have a system that uses the linux 2.6 kernel, ubifs. We use
> a micron nand device.
> The system uses two partitions, one for the ubi rootfs and the other
> for the ubi logfs.
> We found that in the last few months, the system has been failing on
> the logfs. And we lose data. The error seen is "UBIFS error. LEB xx
> scanning failed."
>
> We got around this error by reinstalling (which essentially formats
> the partitions) software. But we lost the data.
>
> Second: The question was how to reproduce the issue. After looking
> through forums, I found that it is mostly related to losing power when
> writing to the nand.
> So we setup a test station with three systems running the same
> software version writing lot of data to the nand and continuously
> powercycling the system. After running the tests for two days, we
> found one system had broken down after 2000 power cycles. While the
> others had not. After restarting the test, we found that another
> system had broken down with the same error after two days but after
> 300 power cycles. This time it failed while scanning LEB 2733.
>
> One of the systems shows the bad block error which seems to show up in
> the ubi rootfs. This does not affect the nand fs.
>
> My worry and question is: Why are all systems not failing after two
> days? One system seems to be more succeptible than others. What could
> be the explanation for that?
> I have some logs. Please have a look and advise.

Without a detailed analyze of the UBI/FS corruptions you face I can't say much.
Maybe your MTD driver has issues, maybe you're using a horrible
screwed vendor kernel...
  Regarding the powercut tests, please use the UBIFS or UBI powercut emulation,
it will stop IO at critical points. If you just power cycle your board
from time to time
there is a high chance that all IO is done while you cut the power.

-- 
Thanks,
//richard
