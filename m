Received: from antispam01.maxim-ic.com ([205.153.101.182])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RqLMz-0005zC-53
 for linux-mtd@lists.infradead.org; Thu, 26 Jan 2012 09:11:50 +0000
From: Brian Foster <brian.foster@maxim-ic.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 2/2] ubinfo: fix `--all' for non-consecutive device numbers
Date: Thu, 26 Jan 2012 09:53:04 +0100
References: <1327563110-23966-1-git-send-email-computersforpeace@gmail.com>
 <1327563110-23966-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1327563110-23966-2-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-ID: <201201260953.04349.brian.foster@maxim-ic.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 26 January 2012 08:31:50 Brian Norris wrote:
> When we have assigned non-consecutive device numbers to our UBI devices [=
=2E..]
> This patch adds a check to first see if device is present, then continue
> to the next ID if it doesn't exist.
>[ ... ]=20

 Looks Ok to me (when used with part 1).

 However, looking at the mtd-utils v1.4.6 =E2=80=98mtdinfo.c=E2=80=99,
 is there a similar issue there?  But I have no idea
 how you could get non-consecutive MTD device numbers?

cheers!
	-blf-

=2D-=20
Brian Foster
Principal MTS, Software        |  La Ciotat, France
Maxim Integrated Products      |  Web:  http://www.maxim-ic.com/
