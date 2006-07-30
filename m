Received: from ug-out-1314.google.com ([66.249.92.168])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G7Gy5-0006rg-3e
	for linux-mtd@lists.infradead.org; Sun, 30 Jul 2006 15:28:57 -0400
Received: by ug-out-1314.google.com with SMTP id u40so451986ugc
	for <linux-mtd@lists.infradead.org>;
	Sun, 30 Jul 2006 12:28:51 -0700 (PDT)
Message-ID: <625fc13d0607301228y2bfd2c62q462c508d57a32043@mail.gmail.com>
Date: Sun, 30 Jul 2006 14:28:51 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
Subject: Re: how to use jff2 on UBI layer?
In-Reply-To: <44C8B789.4030505@yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1152536472.6066.28.camel@localhost.localdomain>
	<004601c6aba6$14554050$c7a3580a@swcenter.sec.samsung.co.kr>
	<20060720094558.GA30897@wohnheim.fh-wedel.de>
	<1153737968.16170.19.camel@sauron.oktetlabs.ru>
	<20060724114007.GB20849@wohnheim.fh-wedel.de>
	<44C8B789.4030505@yandex.ru>
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

On 7/27/06, Artem B. Bityutskiy <dedekind@yandex.ru> wrote:
> Tim, Joern,
>
> I've made JFFS2 be able to mount UBI volumes directly, without gluebi.
>
> Now you can do the folliwing:
>
> 1. mount -t jffs2 ubiX_Y mnt/   --   mount UBI device number <X>, volume
> <Y>;
> 2. mount -t jffs2 ubiY mnt/   --   mount UBI device number 0, volume <Y>;
> 3. mount -t jffs2 ubiX:<name> mnt/   --   mount UBI device X, volume
> with name <name>;
> 4. mount -t jffs2 ubi:<name> mnt/   --   mount UBI device 0, volume with
> name <name>.
>
> The patches are in ubi-2.6.git, please, try.

For what it's worth, I personally prefer the gluebi approach.  Or at
least it's design.  I don't see why UBI cannot add_mtd_device for
every volume that is found within the overall MTD given to it.

It seems somewhat superfluous to add a generalized I/O layer to jffs2.
 It just doesn't sit right with me.

josh
