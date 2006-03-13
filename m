Received: from smtp42.singnet.com.sg ([165.21.103.146])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FIbRM-0001Wm-TY
	for linux-mtd@lists.infradead.org; Sun, 12 Mar 2006 20:01:45 -0500
Message-ID: <4414BE02.3080300@singnet.com.sg>
Date: Mon, 13 Mar 2006 08:34:10 +0800
From: Terence Soh <gopher@singnet.com.sg>
MIME-Version: 1.0
To: Russ Dill <russ.dill@gmail.com>, Josh Boyer <jwboyer@gmail.com>
References: <E1FErAE-00004u-2M@canuck.infradead.org>	
	<44079DE4.3070804@singnet.com.sg>	
	<625fc13d0603100506k31e3da28kd51f65712447165b@mail.gmail.com>
	<f9d2a5e10603100936s43f3d7bdoe8d118b9009ff925@mail.gmail.com>
In-Reply-To: <f9d2a5e10603100936s43f3d7bdoe8d118b9009ff925@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Cramfs on NAND
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

>>Yes, it's still true.  CRAMFS expects it's data to be contiguous so
>>unless you have something similar to a flash translation layer that
>>hides the bad blocks, insanity will ensue.
FTL will not work for me because of the licensing issues :(.

>>Could you use a read-only JFFS2 partition?
Besides the read-only characteristic, I'm also looking at fast mount 
time. I guess I should take a look at YAFFS.

Question: Does a read-only JFFS2/YAFFS partition means that there will 
not be any wear-levelling performed?

> 
> 
> The other solution is to use an ftl ontop of the flash, and then put a
> cramfs on that. Of course, that depends on you living somewhere where
> algorithms are not restricted to those with the license to use them.
> (iirc)
> 

Bye and thanks for your time,
Terence.
