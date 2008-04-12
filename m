Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jkc4O-0001o4-7M
	for linux-mtd@lists.infradead.org; Sat, 12 Apr 2008 09:30:48 +0000
Subject: Re: Question about the size limitation of UBI
From: Artem Bityutskiy <dedekind@infradead.org>
To: Kyungmin Park <kmpark@infradead.org>
In-Reply-To: <9c9fda240804111953s1ef73ecbh4e648a740c77dd0f@mail.gmail.com>
References: <9c9fda240804111953s1ef73ecbh4e648a740c77dd0f@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Sat, 12 Apr 2008 12:28:34 +0300
Message-Id: <1207992514.5965.103.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi  Kyungmin

On Sat, 2008-04-12 at 11:53 +0900, Kyungmin Park wrote:
> It's similar question with MTD size limitation. If I have a 16GiB, or
> 32GiB NAND, then does UBI support this chips?
> or similarly it needs to modify its fields?
UBI addressing is Eraseblock number:offset within eraseblock, not a
32-bit absolute offset as in case of JFFS2. So, UBI limitation is that
the flash has to have not more then 2^31 eraseblocks, which is a huge
size. UBI will barely ever run on such devices.

> I saw the UBI2 word I don't remember the which mail.
> Anyway as you know it has a scalability problem. It scans all blocks.
> So do you have any plan to address this one? or any ideas?
Yes, we have some ideas, but we are not planning to do UBI2 so far.
Although we want to create a short document with ideas about about UBI2
design.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
