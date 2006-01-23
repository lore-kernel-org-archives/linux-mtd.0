Received: from petasus.ims.intel.com ([62.118.80.130])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F15Xu-0006Mv-Gu
	for linux-mtd@lists.infradead.org; Mon, 23 Jan 2006 12:32:09 -0500
Message-ID: <43D512EA.70800@intel.com>
Date: Mon, 23 Jan 2006 20:31:22 +0300
From: "Alexey, Korolev" <alexey.korolev@intel.com>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <43D2ACD7.7010602@inf.u-szeged.hu>
In-Reply-To: <43D2ACD7.7010602@inf.u-szeged.hu>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] JFFS2 kernel panics fixup on Sibley
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Feneric,

Thanks a lot for assistance.

I've download and verified the latest snapshot.
Seems you have commited all neccessary code. Thank you very much!
I did several tests today. Now JFFS2  works rather stable both on Sibley 
and on NAND.


Ferenc Havasi wrote:

> Hi Alexey,
>
> Zoltan and me have verified your patch. We think it is OK, and have
> commited into CVS. We hope the other maintainaers of MTD/JFFS2 will
> agree with it.
>
> We've deleted 3 lines from your patch, which is releted to
> CONFIG_JFFS2_FORCED_BUFFER_FLUSH. We think its your private kernel
> config option.
>
Ooops. I missed to remove this part of code. You are right it's there is 
no need to include it. Currently this part of code is useless.

> Thank you.
>
> Ferenc
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>

Thanks,
Alexey
