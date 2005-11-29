Received: from zproxy.gmail.com ([64.233.162.200])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EhAor-0005qg-QW
	for linux-mtd@lists.infradead.org; Tue, 29 Nov 2005 14:07:16 -0500
Received: by zproxy.gmail.com with SMTP id i11so1356333nzi
	for <linux-mtd@lists.infradead.org>;
	Tue, 29 Nov 2005 11:07:12 -0800 (PST)
Message-ID: <625fc13d0511291107t3495a41byae11ba1832657291@mail.gmail.com>
Date: Tue, 29 Nov 2005 13:07:12 -0600
From: Josh Boyer <jwboyer@gmail.com>
To: Bernhard Priewasser <priewasser@gmail.com>
In-Reply-To: <438C98EA.70105@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <438C7B0C.5040001@gmail.com> <438C94BD.8020300@inf.u-szeged.hu>
	<438C98EA.70105@gmail.com>
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: NAND write buffering
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/29/05, Bernhard Priewasser <priewasser@gmail.com> wrote:
> Hi all,
>
> I just got the cited mail from Ferenc. I think it is useful for other
> people too, that's why it is posted to the list.
>
> Is there anything wrong with our assumptions?

The assumptions seem to be fine.  The usage case you described is
probably the worst case for JFFS2 though.  Lots of small writes
generates lots of data nodes, which in turn increases mount time and
wastes space.  EBS helps with the mount time issue, but the flash
space consumption is larger than it probably needs to be.  But as you
correctly pointed out, there is nothing you can do about that if you
_must_ have it be on flash after every write.

josh
