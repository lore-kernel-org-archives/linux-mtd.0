Received: from mailout01.ims-firmen.de ([213.174.32.96])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CrJXk-00036e-EM
	for linux-mtd@lists.infradead.org; Wed, 19 Jan 2005 12:22:58 -0500
From: "Jochen Karrer" <j.karrer@lightmaze.com>
To: "David Woodhouse" <dwmw2@infradead.org>,
	"Artem B. Bityuckiy" <dedekind@infradead.org>
Date: Wed, 19 Jan 2005 18:22:41 +0100
Message-ID: <MKELJOLMMOHJCMIPKLJKKEBLCBAA.j.karrer@lightmaze.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1106141921.26551.516.camel@hades.cambridge.redhat.com>
Cc: linux-mtd@lists.infradead.org
Subject: AW: mysqld on jffs2: MyISAM Index write is slow
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
mysql writes a 1024 Byte block to the index file for every row. I suspect
that this
block is very similar to the block which is already on disk. Is there some
way to
tell jffs2 to compare the block with the old one and write only the
differences ?

Jochen

> On Wed, 2005-01-19 at 13:03 +0000, Artem B. Bityuckiy wrote:
>> Not expert in this issue, but I was told by David that JFFS2 is
>> synchronous, and you need redesigning it if you want asynchronous
>> behaviour.
>
> It's often been suggested that the best way to do databice on JFFS2
> would just to be to start supporting extended attributes, then design a
> database which uses those for its storage.
