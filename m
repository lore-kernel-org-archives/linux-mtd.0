Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTWl4-0000u3-9k
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 10:10:06 +0000
Received: by wyb28 with SMTP id 28so3718401wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 03:10:04 -0700 (PDT)
Message-ID: <4DECA77B.8050907@gmail.com>
Date: Mon, 06 Jun 2011 14:10:03 +0400
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 041/104] mtd: prepare to convert of_mtd_parse_partitions
	to partition parser
References: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>	
	<1307026293-8535-7-git-send-email-dbaryshkov@gmail.com>	
	<1307347054.3135.28.camel@localhost> <4DEC8C85.6090904@gmail.com>
	<1307348383.3135.41.camel@localhost>
In-Reply-To: <1307348383.3135.41.camel@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06.06.2011 12:19, Artem Bityutskiy wrote:
> On Mon, 2011-06-06 at 12:15 +0400, Dmitry Eremin-Solenikov wrote:
>> Answering both of your questions here:
>> My idea is to have an of node connected to mtd device, if there is
>> any.
>
> I just think the connection should be different. Probably the best would
> be to have an OF-specific object (some struct of_info) containing struct
> mtd_info inside, and then OF code can use container_of().

That will be agains current linux coding practices. E.g. check the gpio, 
i2c, etc. code. All add device_node field to existing structs.

>> It can be used by ofpart.c, ofoldpart.c (extract from physmap_of),
>> maybe some other parsers/drivers/etc.
>
> I'm still not convinced we need ofoldpart.c - that is a small piece of
> cade which can be put to ofpart.c.

Agreed.


-- 
With best wishes
Dmitry
