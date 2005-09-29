Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EKwXo-0005sj-Ge
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2005 07:26:01 -0400
Message-ID: <433BD009.8070201@inf.u-szeged.hu>
Date: Thu, 29 Sep 2005 13:29:13 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
References: <433A640D.6030200@cetrtapot.si>
	<433BA402.3040703@inf.u-szeged.hu>	<20050929093433.GB18741@wohnheim.fh-wedel.de>
	<433BB979.7010904@inf.u-szeged.hu> <433BBB19.9060905@yandex.ru>
	<433BC08C.2030302@inf.u-szeged.hu> <433BC5CD.6080300@yandex.ru>
In-Reply-To: <433BC5CD.6080300@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>,
	"hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>
Subject: Re: Great jffs2 speedup
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityutskiy wrote:

> Ferenc Havasi wrote:
>
>> It think it is the method which is really does not spoil the
>> wear-leveling. The selection of the storing place uses exactly the same
>> function what JFFS2 uses to store any other data.
>
>
> Then I just don't undesstand how it works. A user selects a bolck X
> where CS ought to be kept. JFFS2 crereates CS in X. Then, on each
> mount user specifies X in mount options. And if there are too frequent
> mounts, A becomes worn-out earlier. To avoid this, user should specify
> 2 options - where to find CS and where to store it next time? And
> evenly rotate the CS eraseblock?
>
> Or you mean JFFS2 is itself picking the needed EB? How to find it on
> next mount then?

Using this (second way) when the user umounts the fs, CS stores the
centralized summary with the same function as JFFS2 stores nodes (using
nextblock, etc) The starting location of it can be read from sysfs after
umount. The user has to store it somewhere else, and specify it as a
mount option at next mount. So nothing is stored in fixed place, so I
think it does not spoil wear-leveling.

This (second) way can be usefull if there is a small root partition with
EBS and big home/usr/... with EBS+CS, and the location of the CS is
stored on the root fs. It was /a requisition of our insturial partner.

Ferenc

/
