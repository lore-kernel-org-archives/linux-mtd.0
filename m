Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SF9JW-0001BF-9p
 for linux-mtd@lists.infradead.org; Tue, 03 Apr 2012 19:22:46 +0000
Received: by bkcjk13 with SMTP id jk13so80731bkc.36
 for <linux-mtd@lists.infradead.org>; Tue, 03 Apr 2012 12:22:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5D308BD40154E4439D82454FE483A5020659F81E@EVS4.nam.ci.root>
References: <5D308BD40154E4439D82454FE483A5020655576C@EVS4.nam.ci.root>
 <CAMjpGUenHB6VU7k84E1Qdh+h6V3C1ZY1DVkV3rBmMfCueh2c4A@mail.gmail.com>
 <5D308BD40154E4439D82454FE483A5020659EE00@EVS4.nam.ci.root>
 <CAMjpGUeMXtTTjdOjEyxZM2Gc0Ww9qyViMufSFu22voTLs33Xxg@mail.gmail.com>
 <5D308BD40154E4439D82454FE483A5020659F81E@EVS4.nam.ci.root>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 3 Apr 2012 12:22:23 -0700
Message-ID: <CAMjpGUehny_-ZjoCseFDeqQjbrDy1BAe=bVB0bQfCRcyozfREA@mail.gmail.com>
Subject: Re: User error with fw_printenv - I hope
To: "Bishop, Mark" <Mark.Bishop@cooperindustries.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 3, 2012 at 08:59, Bishop, Mark wrote:
> I don't have a print_loff_t(). =C2=A0I have a ioctl_decode() instead and =
I am trying to cram your patch into it.

all the print_loff_t does is process a pointer to an int.  you could
probably do the same thing by changing the mtd.c file to process the
int directly (look at the other ioctls that do umove() with &i).
-mike
