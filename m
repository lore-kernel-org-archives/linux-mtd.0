Received: from smtp4-g21.free.fr ([212.27.42.4])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MRXyf-0005da-3V
	for linux-mtd@lists.infradead.org; Thu, 16 Jul 2009 20:54:57 +0000
Message-ID: <4A5F938E.5070400@gcasse.net>
Date: Thu, 16 Jul 2009 22:54:38 +0200
From: Gilles Casse <list@gcasse.net>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: UBIFS Corrupt during power failure
References: <C77C279BA71FD14985DC8E75FB265AB70344D104@usw-am-xch-02.am.trimblecorp.net>	<1242721105.3623.0.camel@localhost.localdomain>	<C77C279BA71FD14985DC8E75FB265AB7034DBD10@usw-am-xch-02.am.trimblecorp.net>	<1246627562.20721.190.camel@localhost.localdomain>	<1246627771.20721.191.camel@localhost.localdomain>	<7207AAC68CE347458026863515A07DA102901F3C@usw-am-xch-02.am.trimblecorp.net>	<1246629940.20721.219.camel@localhost.localdomain>	<7207AAC68CE347458026863515A07DA102901F9C@usw-am-xch-02.am.trimblecorp.net>	<1246633131.20721.224.camel@localhost.localdomain>	<1246854654.20721.271.camel@localhost.localdomain>	<20090715205528.GI3056@shareable.org>	<C77C279BA71FD14985DC8E75FB265AB703B47FCE@usw-am-xch-02.am.trimblecorp.net>
	<1247728619.11353.68.camel@localhost.localdomain>
In-Reply-To: <1247728619.11353.68.camel@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Cc: Eric Holmberg <Eric_Holmberg@Trimble.com>,
	Jamie Lokier <jamie@shareable.org>,
	linux-mtd@lists.infradead.org, Urs Muff <urs_muff@Trimble.com>,
	Stefan Roese <sr@denx.de>, Nicolas Pitre <nico@cam.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy a écrit :
> On Wed, 2009-07-15 at 15:36 -0600, Eric Holmberg wrote:
>   
>> indeterminate state for the entire PEB.  Writing all zero's to the
>> header as in Artem's fix should work in all cases excluding the
>> extremely rare cases where a write of 0's is interrupted and the header
>> has been changed to a valid value and in the case where an erase
>> (0-to-1) transition is interrupted which results in a valid header.  The
>> odds against that are huge, so I would expect the flash to wear out
>> before it ever happens in real life.
>>     
>
> Hmm, we can zero out both headers completely by writing 128 bytes,
> even.
>
>   
According to a fellow electronician, Marc, offlist, it would not be safe
to force at 0 a bit already at 0 in flash.
For zeroing a byte, he recommends to write its complementary value (e.g.
if 0x85 is read then write 0x7A).

Best regards,
Gilles
