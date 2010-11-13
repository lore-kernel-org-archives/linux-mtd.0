Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PHEzk-0006f0-3J
	for linux-mtd@lists.infradead.org; Sat, 13 Nov 2010 12:14:16 +0000
Received: by bwz5 with SMTP id 5so3981860bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 13 Nov 2010 04:14:10 -0800 (PST)
Subject: Re: [PATCH] nand wait timeout fix
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <4CD149D2.5080900@parrot.com>
References: <4CD149D2.5080900@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 13 Nov 2010 14:13:59 +0200
Message-ID: <1289650439.2218.47.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Matthieu,

On Wed, 2010-11-03 at 12:38 +0100, Matthieu CASTET wrote:
> nand_wait_ready timeout should not depends of HZ value.
> panic_nand_wait take an relative timeout, not a absolute one.
> warn if nand_wait exit while the nand is still busy.
> 
> Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>

could you please improve commit message so that it would explain why you
do each of the changes, which problem you solve?

...

> @@ -874,7 +874,7 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
>  		chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
>  
>  	if (in_interrupt() || oops_in_progress)
> -		panic_nand_wait(mtd, chip, timeo);
> +		panic_nand_wait(mtd, chip, 400);
>  	else {
>  		while (time_before(jiffies, timeo)) {
>  			if (chip->dev_ready) {

In this cas timeo variable and its calculation can be moved to this
inner block, I suppose?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
