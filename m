Received: from [63.81.120.155] (helo=imap.sh.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KhhZw-0007MP-SP
	for linux-mtd@lists.infradead.org; Mon, 22 Sep 2008 09:19:41 +0000
Message-ID: <48D76321.4000105@ru.mvista.com>
Date: Mon, 22 Sep 2008 13:19:29 +0400
From: Sergei Shtylyov <sshtylyov@ru.mvista.com>
MIME-Version: 1.0
To: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] [MTD-UTILS] Add support for 4KB page flash devices
References: <33142758.53091221828088797.JavaMail.weblogic@epml16>
	<9c9fda240809212322h4d9ac26eqfd7c3cfb9630c97b@mail.gmail.com>
In-Reply-To: <9c9fda240809212322h4d9ac26eqfd7c3cfb9630c97b@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: moorthy.apg@samsung.com, linux-mtd@lists.infradead.org,
	David.Woodhouse@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

Kyungmin Park wrote:

>> We can now use these utilities on 4KB devices.
>>
>> Signed-off-by: Rohit Hagargundgi <h.rohit@samsung.com>
>> ---
>> --- a/flash_otp_write.c 2008-06-27 21:51:28.000000000 +0530
>> +++ b/flash_otp_write.c 2008-07-01 16:04:12.000000000 +0530
>> @@ -18,7 +18,7 @@ int main(int argc,char *argv[])
>>        int fd, val, ret, size, wrote, len;
>>        mtd_info_t mtdInfo;
>>        off_t offset;
>> -       char *p, buf[2048];
>> +       char *p, buf[4096];
>>
>>     
>
> Is it no problem the stack overflow in application?
> How about to use malloc & free?
>   

   Come on, it's only an extra page of stack for a non-recursive 
function -- this shouldn't pose any danger.

WBR, Sergei
