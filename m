Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EHMmK-00027A-9G
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2005 10:38:04 -0400
Message-ID: <432ECD75.1040300@inf.u-szeged.hu>
Date: Mon, 19 Sep 2005 16:38:45 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: Jarkko Lavinen <jarkko.lavinen@nokia.com>
References: <431EAF8F.2000903@inf.u-szeged.hu>
	<20050919142611.GA14858@angel.research.nokia.com>
In-Reply-To: <20050919142611.GA14858@angel.research.nokia.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Erase block summary commited
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jarkko,

>I just tried the CVS head on a device with a JFFS2 image which works
>with summary patch from last May.  With CVS head I got several of 
>
>  JFFS2 warning: (337) jffs2_sum_scan_sumnode: Summary node crc error,
>skipping summary information.
>
>Did the summary node format change recently and do I have to reflash
>in order to use the new summary code?
>  
>
Yes, I've forgotten to warn you. Sorry.

There was some small change in the summary node format (for example
jint16 => jint32) suggested by Joern, which makes necessary to
regenarate summary with the new sumtool utility. If you do it, it should
work fine again.

Bye,
Ferenc
