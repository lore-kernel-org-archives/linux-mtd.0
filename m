Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EI23g-0002wK-5b
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2005 06:42:47 -0400
Message-ID: <43313923.5050308@inf.u-szeged.hu>
Date: Wed, 21 Sep 2005 12:42:43 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: =?ISO-8859-2?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <20050920113616.GD2143@wohnheim.fh-wedel.de>	<BAY17-F127FC28C2D9627C1F5DCC6E8940@phx.gbl>
	<20050921071036.GA9369@wohnheim.fh-wedel.de>
In-Reply-To: <20050921071036.GA9369@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Cc: zhao forrest <zhao_fusheng@hotmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]Add JFFS2 eraseblock header support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear All,

I just would like to write my opinion about these topics.

I don't think that we should keep absolut monkey-safe compatibility. To
deal still with 1:N images makes the things unnecessary complicated
IMHO. The big warning (what Joern wrote to the list) should be enough
for every serious user. Or there is one more thing what we can do: if we
detect a cross-erase block node we reject mounting/set read-only flag.
Is there anything other (than cross erase block nodes) can be problem
with 1:N => 1:1?

I agree with Joern that erase block header now only a performance
improvement, so it should not be INCOMPAT. I think it would not even
solve the 1:N => 1:1 problem well. It only force the user than if he
uses new utils (mkfs.jffs2, ..) than use new JFFS2, tool; and if he used
a newer JFFS2 code, do not use an older one again. Nothing more. (Did I
misunderstand something?) I don't think that it is a real problem. But
if we afraid of it, I think we should introduce a distict new node type,
and not new types for inodes and dirents.

Bye,
Ferenc

P.S.: Zhao: If your patch reach the final state we will extend the
summary code to handle your node type correctly, too.
