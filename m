Received: from [82.179.117.26] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1G7SRa-00060S-R3
	for linux-mtd@lists.infradead.org; Mon, 31 Jul 2006 03:44:15 -0400
Message-ID: <44CDB4A4.1010809@yandex.ru>
Date: Mon, 31 Jul 2006 11:43:32 +0400
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
	<44CDAF7D.4040300@yandex.ru>
In-Reply-To: <44CDAF7D.4040300@yandex.ru>
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

Artem B. Bityutskiy wrote:

>> For what it's worth, I personally prefer the gluebi approach.  Or at
>> least it's design.  I don't see why UBI cannot add_mtd_device for
>> every volume that is found within the overall MTD given to it.
> 
> Just because it's strange from the design POV. UBI != MTD device 
> semantically => any attempt to access UBI as MTD device is a dirty hack.

Err, I have to refine my position Of course, the idea itself is OK - it 
is useful to make MTD-oriented software work on top of UBI. But it is 
still a hack, just because UBI != MTD subset, strictly speaking.

But again, see in my previous maul, JFFS2's gluebi port has little to do 
with a transparent MTD emulation layer. At lease the gluebi I'm aware of.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
