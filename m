Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xb3Gd-0005uE-Sb
 for linux-mtd@lists.infradead.org; Mon, 06 Oct 2014 08:03:40 +0000
Date: Mon, 6 Oct 2014 09:53:01 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Woody Wu <narkewoody@gmail.com>
Subject: Re: Block numbers of BEB
In-Reply-To: <db3c3c22-b896-4b73-bece-99a1db7d602a@email.android.com>
Message-ID: <alpine.DEB.2.02.1410060950270.17221@lnxricardw1.se.axis.com>
References: <e8d296e4-0194-4e0f-8f4d-1defe17bdd65@email.android.com>
 <CAFLxGvxm7RU-_5r658pA2C5EJ6NGGX2sfErNB9Hosq98QP8G2A@mail.gmail.com>
 <db3c3c22-b896-4b73-bece-99a1db7d602a@email.android.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
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


On Sun, 5 Oct 2014, Woody Wu wrote:

> What I said of checking /proc is wrong. What I indeed checked was 
> /sys/class/ubi as you mentioned. The problem is, under the 
> /sys/class/ubi, there is no information about what blocks are marked as 
> bad, there is only information about the total number of bad blocks.

I was thinking the mtd tool nanddump displayed which blocks were bad when 
dumping, but a quick test just now revealed that that doesn't seem to be 
the case.

The information is available to userspace though, so it's fairly easy to 
hack together a userspace tool that gets the bad block information via 
ioctls.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
