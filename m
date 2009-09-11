Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mm323-0007S7-Nb
	for linux-mtd@lists.infradead.org; Fri, 11 Sep 2009 10:07:12 +0000
Message-ID: <4AAA2132.9080000@gmail.com>
Date: Fri, 11 Sep 2009 13:06:42 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: JiSheng Zhang <jszhang3@gmail.com>
Subject: Re: UBIFS power cut issues
References: <2df346410909020235v5258eba3l30ff731841acc71@mail.gmail.com>	
	<1252390936.5060.47.camel@localhost>	
	<2df346410909090245v5995842asf3a94ae40da5fa72@mail.gmail.com>	
	<1252597344.5060.99.camel@localhost>
	<2df346410909110233n6b434567qb2bbbb380417adf7@mail.gmail.com>
In-Reply-To: <2df346410909110233n6b434567qb2bbbb380417adf7@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/11/2009 12:33 PM, JiSheng Zhang wrote:
>> However, UBIFS is sometimes used as a JFFS2 replacement and people may
>> want it to behave the same way as JFFS2 if it is mounted synchronously.
>> This is doable, but needs some non-trivial development, so this was not
>> implemented so far. On the other hand, there was no strong demand. You
>> may implement this as an excercise, or you may try to convince UBIFS
>> authors to do this.
>
> Hmmm, this style(there's hole at the end of file) can be accepted.

Also note, due to an MM but the pages are sometimes written not exactly
in order. Adrian made a patch for this, but the patch was not yet made
it upstream:

http://marc.info/?l=linux-kernel&m=125233252015797&w=2

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
