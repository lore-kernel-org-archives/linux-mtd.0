Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PxERS-0002DF-R2
	for linux-mtd@lists.infradead.org; Wed, 09 Mar 2011 08:08:23 +0000
Received: by ewy3 with SMTP id 3so75783ewy.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 09 Mar 2011 00:08:20 -0800 (PST)
Subject: Re: Tool to generate NAN_ECC_SOFT OOB data?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Daniel Hobi <daniel.hobi@schmid-telecom.ch>
In-Reply-To: <4D76400D.7070408@schmid-telecom.ch>
References: <4D76400D.7070408@schmid-telecom.ch>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 09 Mar 2011 10:06:53 +0200
Message-ID: <1299658013.2741.0.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Frank Haverkamp <haver@vnet.ibm.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-03-08 at 15:41 +0100, Daniel Hobi wrote:
> mtd-utils.git once contained such a tool called bin2nand which was
> removed with commit 94a20240 (ubi-utils: remove old ubi-utils) on
> 2010-09-28. Does anyone know a replacement tool?
> 
> @Frank: a long time ago (2008-02-18), you tried to move bin2nand to the
> top-level directory. Do you still use such a tool?

Daniel, the best you can do is to pick that utility, massage it, and
submit a patch!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
