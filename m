Received: from hs-out-0708.google.com ([64.233.178.250]
	helo=hs-out-2122.google.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JLMku-0007n2-QS
	for linux-mtd@lists.infradead.org; Sat, 02 Feb 2008 18:06:27 +0000
Received: by hs-out-2122.google.com with SMTP id 23so2956335hsn.2
	for <linux-mtd@lists.infradead.org>;
	Sat, 02 Feb 2008 10:06:20 -0800 (PST)
Message-ID: <47A4B0E9.60600@gmail.com>
Date: Sat, 02 Feb 2008 23:35:29 +0530
From: Max Stirling <vicky.irobot@gmail.com>
MIME-Version: 1.0
To: vishalk@tataelxsi.co.in
Subject: Re: how to access nand flash from user space
References: <002201c865a2$66fa34c0$65053c0a@telxsi.com>
	<47A4AFF5.8030901@gmail.com>
In-Reply-To: <47A4AFF5.8030901@gmail.com>
Content-Type: multipart/mixed; boundary="------------020507020803040007060805"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------020507020803040007060805
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Max Stirling wrote:
> vishalk wrote:
>> Hi,
>>
>> I have been trying to access nand flash from user space.
>> I am using the functions 'mtd_write' and 'mtd_read' in mtdchar.c .
How do you use mtd_read and mtd_write functions when they are static? 
Are you meaning to say from your user application you open the 
/dev/mtdchar and do a read and write?
>> when I include the mtd.h file, I get compilation errors pertaining to 
>> the
>> mtd.h file. can someone please tell me how to access these functions 
>> from user space.
>>   
> Hmm...could you paste the error log please. That might be of some help 
> to help you.
>
>> Thanks,
>> VK 
>> The information contained in this electronic message and any 
>> attachments to this message are intended for the exclusive use of the 
>> addressee(s) and may contain proprietary, confidential or privileged 
>> information. If you are not the intended recipient, you should not 
>> disseminate, distribute or copy this e-mail. Please notify the sender 
>> immediately and destroy all copies of this message and any 
>> attachments contained in it.
>>
>> Contact your Administrator for further information.
>>
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>   
>


--------------020507020803040007060805
Content-Type: text/x-vcard; charset=utf-8;
 name="vicky_irobot.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="vicky_irobot.vcf"

begin:vcard
fn:Max Stirling
n:Stirling;Max
email;internet:vicky.irobot@gmail.com
x-mozilla-html:FALSE
version:2.1
end:vcard


--------------020507020803040007060805--
