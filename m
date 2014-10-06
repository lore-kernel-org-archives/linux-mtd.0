Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xb493-0005mQ-Un
 for linux-mtd@lists.infradead.org; Mon, 06 Oct 2014 08:59:54 +0000
Date: Mon, 6 Oct 2014 10:59:26 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Woody Wu <narkewoody@gmail.com>
Subject: Re: Block numbers of BEB
In-Reply-To: <22ddcb2d-d790-4e3e-af60-6bae0465295a@email.android.com>
Message-ID: <alpine.DEB.2.02.1410061058300.17221@lnxricardw1.se.axis.com>
References: <e8d296e4-0194-4e0f-8f4d-1defe17bdd65@email.android.com>
 <CAFLxGvxm7RU-_5r658pA2C5EJ6NGGX2sfErNB9Hosq98QP8G2A@mail.gmail.com>
 <db3c3c22-b896-4b73-bece-99a1db7d602a@email.android.com>
 <alpine.DEB.2.02.1410060950270.17221@lnxricardw1.se.axis.com>
 <22ddcb2d-d790-4e3e-af60-6bae0465295a@email.android.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 6 Oct 2014, Woody Wu wrote:

> >The information is available to userspace though, so it's fairly easy
> >to 
> >hack together a userspace tool that gets the bad block information via 
> >ioctls.
> 
> Do you know in what kernel .c file that contain the information?  Is it 
> in mtd or ubi?

There is an ioctl called MEMGETBADBLOCK which returns information about 
the bad block status of a given (physical) flash block.

See include/uapi/mtd/mtd-api.h in the kernel for details.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
