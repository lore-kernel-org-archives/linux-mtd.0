Received: from cerga.lunarpages.com ([67.210.123.115])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S0hW2-0006Tj-O0
 for linux-mtd@lists.infradead.org; Thu, 23 Feb 2012 22:52:00 +0000
Message-ID: <4F466EE3.2070500@softel.net.mx>
Date: Thu, 23 Feb 2012 16:52:51 +0000
From: Esteban Lopez <elopez@softel.net.mx>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: df -h, du -ahx and flash size not match
References: <4F4285AF.30300@softel.net.mx>	<CAN8TOE_dF1ri7cxMVBzZ9Mwqv-XCyo+mZJi1Nwhb7-OkBErU_A@mail.gmail.com>	<4F45FE0C.3070807@softel.net.mx>
 <CAN8TOE_uX0zY7vikXNUgBjU6Lyp5tVyOEpcDydsFeOt8uAzT-A@mail.gmail.com>
In-Reply-To: <CAN8TOE_uX0zY7vikXNUgBjU6Lyp5tVyOEpcDydsFeOt8uAzT-A@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

I got it!!! Thank you again


El 02/23/2012 07:35 PM, Brian Norris escribió:
> On Thu, Feb 23, 2012 at 12:51 AM, Esteban Lopez<elopez@softel.net.mx>  wrote:
>> Hello Brian
>>
>> After re read the link and make some test I found that -c option in my
>> mkfs.ubi command was the reason because I had 236M in total space. I
>> modified this parameter from 2048 to 3570 and now I have a  volume of 400
>> MiB
>>
>> Now is clear for me how interpreted the df and du output.
>>
>> Thank you for your help!!!!
> You're welcome for the small pointer :)
>
> BTW, when you are corresponding with people on mailing lists, it's
> good practice to Reply-All. That way, you CC the mailing list and
> others can see if/how you fixed your problems.
>
> Brian
>
