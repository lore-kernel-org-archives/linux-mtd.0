Received: from mika.eatserver.nl ([195.20.9.75])
	by casper.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pxxfb-0004Pi-Kk
	for linux-mtd@lists.infradead.org; Fri, 11 Mar 2011 08:26:00 +0000
Received: from [195.242.97.150] (qore.networks.above.net [195.242.97.150] (may
	be forged)) (authenticated bits=0)
	by mika.eatserver.nl (8.13.8/8.13.8) with ESMTP id p2B8Prt8004287
	for <linux-mtd@lists.infradead.org>; Fri, 11 Mar 2011 09:25:53 +0100
Received: from localhost (localhost.localhost [127.0.0.1])
	by router38.aimvalley.nl (Postfix) with ESMTP id 38797818103
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Mar 2011 09:25:53 +0100 (CET)
Received: from mail3.aimsys.nl (mail.aimsys.nl [10.10.0.114])
	by router38.aimvalley.nl (Postfix) with ESMTP id BDE54818102
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Mar 2011 09:25:52 +0100 (CET)
Message-ID: <4D79DC90.6070600@aimvalley.nl>
Date: Fri, 11 Mar 2011 09:25:52 +0100
From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [RFC] Handling of errors for AMD NOR (cfi_cmdset_0002) chips
References: <4D797E23.6070409@emcraft.com>
In-Reply-To: <4D797E23.6070409@emcraft.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/11/11 02:42, Ilya Yanok wrote:
> Hello,
>
> current cfi_cmdset_0002.c code does not implement handling of error statuses reported by the chip during write/erase and just waits for a software timeout instead.
>
> We think that proper handling of these conditions could help us to debug the issue we have with the NOR flash and UBIFS so we'd like to implement such handling.
>
> I've tried to do this, please see my initial patch below. For now errors are just reported via pr_debug().
>
> I'd like to hear any comments. Am I doing things right or not? Maybe I'm missing something?
>


What issue you have with NOR flash and UBIFS ?

---
N. van Bolhuis.
