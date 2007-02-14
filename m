Received: from alnrmhc12.comcast.net ([206.18.177.52])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HHRff-0001w5-7r
	for linux-mtd@lists.infradead.org; Wed, 14 Feb 2007 16:28:14 -0500
Message-ID: <45D37D96.4010501@ringle.org>
Date: Wed, 14 Feb 2007 16:22:30 -0500
From: Jon Ringle <jon@ringle.org>
MIME-Version: 1.0
To: =?UTF-8?B?SsO2cm4gRW5nZWw=?= <joern@lazybastard.org>
Subject: Re: [SPAM]  Re: P30 flash left in read status mode after a write
References: <45D35A6F.3060203@ringle.org>
	<20070214205601.GB20486@lazybastard.org>
In-Reply-To: <20070214205601.GB20486@lazybastard.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jörn Engel wrote:
> On Wed, 14 February 2007 13:52:31 -0500, Jon Ringle wrote:
>   
>> This did indeed seem to fix the problem, but I'm not sure if I might 
>> inadvertently be causing some side effect. I believe that I might be 
>> taking a slight performance hit to consecutive jffs2 write operations 
>> because now each write operation will need to spend more cycles putting 
>> the flash in to a write mode.
>>     
>
> If the performance hit concerns you, you could set a timer instead of
> changing the chip state.  Only if the timer expires - which means that
> consecutive writes are a non-issue - do you change the chip state.
>
>   
Using a timer sounds like a good idea. I'll keep it in mind. I'm not 
sure yet whether I'm concerned about the performance hit as I haven't 
profiled the impact yet. Has anyone got any data that shows what kind of 
improvement jffs2 write operations get with this optimization in place 
to leave flash in read status mode?

Jon
