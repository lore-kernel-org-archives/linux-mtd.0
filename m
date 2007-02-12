Received: from [210.94.41.89] (helo=july7)
	by canuck.infradead.org with esmtpsa (Exim 4.63 #1 (Red Hat Linux))
	id 1HGTrc-0004mw-Kl
	for linux-mtd@lists.infradead.org; Mon, 12 Feb 2007 00:36:33 -0500
From: "Kyungmin Park" <kmpark@infradead.org>
To: <linux-mtd@lists.infradead.org>
References: <007101c74e4c$bdb8bbb0$c7a3580a@swcenter.sec.samsung.co.kr>
Subject: RE: [PATCH] [MTD] Make ecclayout static const
Date: Mon, 12 Feb 2007 14:36:28 +0900
Message-ID: <007201c74e67$c0d94150$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
In-reply-to: <007101c74e4c$bdb8bbb0$c7a3580a@swcenter.sec.samsung.co.kr>
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There's missing one in OneNAND.

>  
> -	for (free = this->ecclayout->oobfree; free->length; ++free) {
> +	free = this->ecclayout->oobfree;
> +	for (i = 0; i < ARRAY_SIZE(this->ecclayout->oobfree); 
> i++, free++) {

After changint "static const" If we only check the free->length, it can
point beyond the ecclayout->oobfree. Since it casts the free pointer and
only check length.
If we only check the array_size, it mis-calculate the readcol & readend in
1KB page OneNAND
So we have to check both array_size and free->length.

for (i = 0; i < ARRAY_SIZE(this->ecclayout->oobfree) && free->length; i++,
free++)

>  
> @@ -1270,19 +1277,22 @@ static int 
> onenand_fill_auto_oob(struct mtd_info *mtd, u_char *oob_buf,
>  				  const u_char *buf, int column, int
> thislen)
>  {
>  
> -	for (free = this->ecclayout->oobfree; free->length; ++free) {
> +	free = this->ecclayout->oobfree;
> +	for (i = 0; i < ARRAY_SIZE(this->ecclayout->oobfree); 
> i++, free++) {

Same as above

After previous mail comments. I will post it again.

Thank you,
Kyungmin Park
