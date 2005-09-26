Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EJpj2-00070h-Mi
	for linux-mtd@lists.infradead.org; Mon, 26 Sep 2005 05:56:50 -0400
Message-ID: <4337C619.2070300@inf.u-szeged.hu>
Date: Mon, 26 Sep 2005 11:57:45 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
References: <4337BF3F.5020200@yandex.ru>
In-Reply-To: <4337BF3F.5020200@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: EBS minor offer
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

> in JFFS2 on-flash nodes' names start from jffs2_raw_, why don't you
> name your summary nodes jffs2_raw_summary instead, just to be
> consistent with the style?
>
You are right, I'll change it today. (and now I noticed the comment at
the nodetype of summary node is also incorrect)

Thanks,
Ferenc
