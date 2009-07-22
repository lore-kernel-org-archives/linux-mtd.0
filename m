Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MTdY0-0001vH-V0
	for linux-mtd@lists.infradead.org; Wed, 22 Jul 2009 15:16:05 +0000
Message-ID: <4A672CF9.90705@nokia.com>
Date: Wed, 22 Jul 2009 18:15:05 +0300
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
MIME-Version: 1.0
To: Canella Matteo <Matteo.Canella@mta.it>
Subject: Re: LEB size configuration
References: <531B6536C9F737458807DF75064873C8303DD7D768@mta-digimail.MTA.INT>	<4A66B547.6020207@nokia.com>	<BD9F3F3F5A6CCF4BA032B9FED4DD312E5D09531F0B@mta-digimail.MTA.INT>	<4A66D988.4050503@nokia.com>
	<BD9F3F3F5A6CCF4BA032B9FED4DD312E5D09531F36@mta-digimail.MTA.INT>
	<4A6727DE.4020005@gmail.com>
	<BD9F3F3F5A6CCF4BA032B9FED4DD312E5D09531F3C@mta-digimail.MTA.INT>
In-Reply-To: <BD9F3F3F5A6CCF4BA032B9FED4DD312E5D09531F3C@mta-digimail.MTA.INT>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "Hunter Adrian \(Nokia-D/Helsinki\)" <adrian.hunter@nokia.com>,
	"'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/22/2009 06:12 PM, Canella Matteo wrote:
> Hi Artem, thanks for your quick reply,
>
>> You cannot improve your UBI attach time without doing coding,
>> unfortunately. If you are ready to do coding, you should really
>> go through UBI documentation. It answers your question.
>
> I've misunderstood Adrian's answer.
> I thought it was possible to double LEB size without modifying UBI layer.

Well, when you or someone else implement this, it will be possible :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
