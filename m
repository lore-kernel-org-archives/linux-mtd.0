Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CMORZ-0007aT-Q4
	for linux-mtd@lists.infradead.org; Tue, 26 Oct 2004 06:20:47 -0400
Message-ID: <417E25EE.40109@inf.u-szeged.hu>
Date: Tue, 26 Oct 2004 12:24:46 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: Jarkko Lavinen <jarkko.lavinen@nokia.com>
References: <41767593.9030004@inf.u-szeged.hu>
	<1098365059.13633.1257.camel@hades.cambridge.redhat.com>
	<41781683.3020602@inf.u-szeged.hu> <4179009D.8010409@oktetlabs.ru>
	<20041026092928.GA23914@angel.research.nokia.com>
In-Reply-To: <20041026092928.GA23914@angel.research.nokia.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: ext Artem Bityuckiy <dedekind@oktetlabs.ru>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, jffs-dev@axis.com
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jarkko,

 > If dentries were stored just as they are (unstripped and uncompressed)
 > in the summary, the summary size would grow by 50% to about 3% of the
 > whole image size.

Thanks, good to know it.

Did you got ECC/CRC errors? The most interest test for me whould be to 
test the new (sumtool) image with the original kernel (because the 
summary nodes are compatibles it should work), and see if there is 
ECC/CRC errors or not.

Bye,
Ferenc
