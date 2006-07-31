Received: from [82.179.117.26] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1G7SqP-0006gC-Kw
	for linux-mtd@lists.infradead.org; Mon, 31 Jul 2006 04:09:50 -0400
Message-ID: <44CDBAA7.8020500@yandex.ru>
Date: Mon, 31 Jul 2006 12:09:11 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Josh Boyer <jwboyer@gmail.com>
Subject: Re: how to use jff2 on UBI layer?
References: <1152536472.6066.28.camel@localhost.localdomain>	
	<004601c6aba6$14554050$c7a3580a@swcenter.sec.samsung.co.kr>	
	<20060720094558.GA30897@wohnheim.fh-wedel.de>	
	<1153737968.16170.19.camel@sauron.oktetlabs.ru>	
	<20060724114007.GB20849@wohnheim.fh-wedel.de>	
	<44C8B789.4030505@yandex.ru>
	<625fc13d0607301228y2bfd2c62q462c508d57a32043@mail.gmail.com>
In-Reply-To: <625fc13d0607301228y2bfd2c62q462c508d57a32043@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, haver@vnet.ibm.com,
	=?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>,
	Marteo Tim <tim.marteo@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Josh Boyer wrote:
> It seems somewhat superfluous to add a generalized I/O layer to jffs2.
> It just doesn't sit right with me.

And after all, what do you mean by superfluous? One more function call? 
NP - this is a technical question, I can easily turn that into a macro.

With my patch, JFFS2 I/O is clean and modularized. Examples:

You have (jffs2_io)->cm_needed field which tells you if this particular 
I/O backend needs clean markers. E.g. - Dataflash and UBI does not need 
them. Or do you prefer this setup_data_flash() stuff in wbuf.c???

Also, for eCos, you may put all the differences to io.c and don't spread 
this over all sources.

Etc.

You just put all I/O-related stuff like this in one place. And depending 
on the I/O backend you initialize it. And all this is in io.c file.

So, it only makes JFFS2 more understandable and cleaner. And it makes 
sense even without UBI. Is this "superfluous" ? I think no.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
