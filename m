Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1essER-0000LK-1P
 for linux-mtd@lists.infradead.org; Mon, 05 Mar 2018 15:40:57 +0000
From: Richard Weinberger <richard@nod.at>
To: Arushi Singhal <arushisinghal19971997@gmail.com>
Cc: boris.brezillon@free-electrons.com, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [PATCH] mtd: nand: Added spaces around ('=' and '<')
Date: Mon, 05 Mar 2018 16:42:03 +0100
Message-ID: <2872216.aoWXzO2rYL@blindfold>
In-Reply-To: <20180303140233.GA9634@seema-Inspiron-15-3567>
References: <20180303140233.GA9634@seema-Inspiron-15-3567>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Arushi Singhal,

Am Samstag, 3. M=E4rz 2018, 15:02:33 CET schrieb Arushi Singhal:
> Add spaces around ('=3D' and '<'),  to conform to the Linux
> kernel coding style. Issue found using checkpatch.

please fix real issues. Coding style fixes to existing code just add too mu=
ch=20
churn. Except for drivers/staging/.

If you're looking for a small MTD related project, I can offer the followin=
g.
Cleanup all ubi_assert()s in drivers/mtd/ubi/.
Some of them need to be transformed into a meaningful warning/error message=
,=20
others into a hard error, such as WARN_ON().
Review/understand every ubi_assert() and convert it.

Thanks,
//richard=20
