Received: from mail-wr0-x236.google.com ([2a00:1450:400c:c0c::236])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1em37G-00068e-Ve
 for linux-mtd@lists.infradead.org; Wed, 14 Feb 2018 19:53:20 +0000
Received: by mail-wr0-x236.google.com with SMTP id 34so1132701wre.13
 for <linux-mtd@lists.infradead.org>; Wed, 14 Feb 2018 11:53:08 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CALLGbRLui7iAmntkTDaptEUJ685LRfbaznq2a0ioPDSz5+B8-w@mail.gmail.com>
References: <CAJ2oMhK_oH9RfekXiuTw25rghdXWjH4Ju_WCiC6ey5hccvHx1g@mail.gmail.com>
 <CALLGbRLui7iAmntkTDaptEUJ685LRfbaznq2a0ioPDSz5+B8-w@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 14 Feb 2018 20:53:06 +0100
Message-ID: <CAFLxGvydCpOJSct-zvCY3f8hzyZsvxq-MxYsgHmcgSmURZK+bA@mail.gmail.com>
Subject: Re: Writing log in flash
To: Steve deRosier <derosier@gmail.com>
Cc: Ran Shalit <ranshalit@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 14, 2018 at 8:53 AM, Steve deRosier <derosier@gmail.com> wrote:
> Hopefully I'm right in the above and I can save Richard or Boris a few
> moments of time; otherwise I'm sure someone will chime in and correct
> me. Again, I'll be clear: the above is based on the devices I use and
> might not apply to all. And if you haven't already, read the datasheet
> of the NAND you are using.

Thanks for the nice overview!

I have only one thing to highlight, UBIFS is a general purpose
filesystem, which means that
it has to fulfill (most) requirements from POSIX. Depending on the
type of logging you can also
consider directly writing to UBI itself. But in most cases it is not
worth the hassle.

-- 
Thanks,
//richard
