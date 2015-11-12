Received: from mail-ob0-x232.google.com ([2607:f8b0:4003:c01::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwoZV-00065g-Dj
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 09:53:38 +0000
Received: by obdgf3 with SMTP id gf3so42713283obd.3
 for <linux-mtd@lists.infradead.org>; Thu, 12 Nov 2015 01:53:15 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1447320688-3086-1-git-send-email-mkl@pengutronix.de>
References: <1447320688-3086-1-git-send-email-mkl@pengutronix.de>
Date: Thu, 12 Nov 2015 10:53:15 +0100
Message-ID: <CAFLxGvzd8R3ZWD7WHUzTwjdEfd9y+249x7CTUWLJvbPWOF7cnA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mkfs.ubifs: cleanups + extended attribute support
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 kernel@pengutronix.de
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 12, 2015 at 10:31 AM, Marc Kleine-Budde <mkl@pengutronix.de> wrote:
> Hello,
>
> this series applies to current git master. The first 3 patches are cleanup
> patches, in the 4th adds extended attributes support. Patch 5 adds a option to
> write the used inode number to an extended attribute, so that other offline
> tools like IMA, that process the inode number can work. See description of
> patch 5 for a detailed explanation.
>
> regards,
> Marc
>
> changes since v1:
> - add Daniel Walter's reviewed by to patches 1-3
> - add option to build without xattr support - patches 4,5 (as Daniel suggested)
> - switch from dynamically allocated attr value buffer to fixed size array on stack,
>   as inode numbers where not stable between mkfs.ubifs invocations - patch 4

Applied and pushed.
And bonus points for rebasing to the latest mtd-utils tree! :-)

-- 
Thanks,
//richard
