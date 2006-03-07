Received: from wproxy.gmail.com ([64.233.184.200])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FGhcA-00005D-JG
	for linux-mtd@lists.infradead.org; Tue, 07 Mar 2006 14:13:04 -0500
Received: by wproxy.gmail.com with SMTP id 57so1469951wri
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Mar 2006 11:12:54 -0800 (PST)
Message-ID: <625fc13d0603071112w2b846443n466c8cc77cb37211@mail.gmail.com>
Date: Tue, 7 Mar 2006 13:12:53 -0600
From: "Josh Boyer" <jwboyer@gmail.com>
To: "trimarchi@gandalf.sssup.it" <trimarchi@gandalf.sssup.it>
In-Reply-To: <20060307200320.vret812nko8k0k4g@feanor.sssup.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <20060307200320.vret812nko8k0k4g@feanor.sssup.it>
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 3/7/06, trimarchi@gandalf.sssup.it <trimarchi@gandalf.sssup.it> wrote:
> Hi all,
> I need to know the order of magnitude of time spent to mount a NAND of 12=
8MB
> using a jffs2 filesystem.

That's a pretty vague question, so I'll give you a vague answer:

It will take less than 3 years to mount a NAND of 126MiB using a JFFS2
filesystem.

If you specify more information, perhaps you'll get a better answer.=20
Things like the type of processor, the type of NAND flash, how full
the filesystem is, whether or not the Summary option is on, etc. all
have a direct impact to your question.

josh
