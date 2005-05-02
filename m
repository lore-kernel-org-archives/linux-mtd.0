Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DSXDC-0001T4-UF
	for linux-mtd@lists.infradead.org; Mon, 02 May 2005 05:27:35 -0400
Message-ID: <42760103.4010202@inf.u-szeged.hu>
Date: Mon, 02 May 2005 11:29:23 +0100
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: Sergei Sharonov <sergei.sharonov@halliburton.com>
References: <loom.20050429T162520-770@post.gmane.org>
In-Reply-To: <loom.20050429T162520-770@post.gmane.org>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: summary patch
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sergei,

> JFFS2: not enough space for summary, padsize = -530
> JFFS2: not enough space for summary, padsize = -199
> JFFS2: not enough space for summary, padsize = -992
> JFFS2: not enough space for summary, padsize = -127
> 
> Is that a note, a warning or an error?

It is a warning.

I think you you did not used sumtool2, did you? (it is a user-space tool 
for generating summary for an image)

Regards,
Ferenc
