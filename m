Received: from ti-out-0910.google.com ([209.85.142.190])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KCvSJ-0003UX-Vo
	for linux-mtd@lists.infradead.org; Sun, 29 Jun 2008 11:52:32 +0000
Received: by ti-out-0910.google.com with SMTP id a21so624097tia.2
	for <linux-mtd@lists.infradead.org>;
	Sun, 29 Jun 2008 04:52:28 -0700 (PDT)
Message-ID: <366f00c80806290452r6d55feb5w49ab0fb70315a206@mail.gmail.com>
Date: Sun, 29 Jun 2008 17:22:28 +0530
From: "Sudeep K N" <sudeepholla.maillist@gmail.com>
To: "Suresh Rajashekara" <suresh@mistralsolutions.com>,
	linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Cleanmarker Issue
In-Reply-To: <48580867.6030403@mistralsolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <4856F1F7.4040003@mistralsolutions.com>
	<366f00c80806161827q46a5ea2bmc0e51f5c4d6c96ec@mail.gmail.com>
	<48580867.6030403@mistralsolutions.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 18, 2008 at 12:24 AM, Suresh Rajashekara
<suresh@mistralsolutions.com> wrote:
> Sudeep K N wrote:
>>
>> Hi,
>>
>> The clean marker is not getting written to spare area on your nand device.
>> The first 4 bytes of clean maker is 19852003 I think.
>> Just check whether you are getting spare write request for these bytes in
>> your
>> Nand driver and also check if you have written it properly to the spare
>> area.
>>
>
> Thanks Sudeep. I think the oneNAND driver has some issues. Now I guess I am
> in the right direction.
>
> One more question I have is, why the first 2 bytes are ff ff and the
> cleanmarker is starting from the 3rd byte? Is this how it is? I thought the
> cleanmarker should start from the first byte.
>
> Thanks in advance,
>
> Best Regards,
> Suresh
>

No cleanmarker doesnot always start from 1st byte
The position of cleanmarker depends on the oobfree area specified by
you through
struct nand_ecclayout

-- 
Regards,
Sudeep
