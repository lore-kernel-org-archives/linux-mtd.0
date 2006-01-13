Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ExMIM-000652-AX
	for linux-mtd@lists.infradead.org; Fri, 13 Jan 2006 05:36:45 -0500
Message-ID: <43C783D9.1030700@inf.u-szeged.hu>
Date: Fri, 13 Jan 2006 11:41:29 +0100
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: "Alexey, Korolev" <alexey.korolev@intel.com>
References: <1135735258.3155.8.camel@localhost.localdomain>
	<43C50274.8060606@intel.com>
In-Reply-To: <43C50274.8060606@intel.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, "Zhao, Forrest" <forrest.zhao@intel.com>
Subject: Re: [PATCH] JFFS2 kernel panics fixup on Sibley
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Alexey,

> I verified the latest mtd snapshot it looks it still doesn't contain
> fixes I sent.
> Would you please review and checkin the patch if nobody has complains
> about it .
>
We've verified your patch and commited it into the CVS. (scan.c,
nodelist.c) The scan.c part of the patch was the same as Zoltan also
found. It fixes the current snapshot, I think now it is usable. (at
least here)

Thanks.

Regards,
Ferenc
