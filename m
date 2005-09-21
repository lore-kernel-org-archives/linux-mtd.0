Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EI4fm-0005ou-L6
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2005 09:30:21 -0400
Message-ID: <4331603B.7000703@yandex.ru>
Date: Wed, 21 Sep 2005 17:29:31 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
References: <20050920211427.GF8421@lunn.ch> <43313429.6040701@yandex.ru>
In-Reply-To: <43313429.6040701@yandex.ru>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Andrew Lunn <andrew@lunn.ch>, linux-mtd@lists.infradead.org,
	jffs-dev@axis.com
Subject: Re: Compilation errors with latest CVS code
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityutskiy wrote:
> Andrew Lunn wrote:
> 
>> Hi folks
>>
>> Im using the MTD CVS trunk from today along with Linux 2.6.13.  I'm
>> not using NAND flash, NOR flash with transparent ECC or DataFlash, so
>> i disabled JFFS2_FS_WRITEBUFFER. The compilation the fails:
> 
> 
> Josh Boyer wrote:
>> Argh guys!  When compiling with CONFIG_JFFS2_FS_WRITEBUFFER not set we
>> get the following error:
> 
> I'll take care about this today.
> 
Fixed.
-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
