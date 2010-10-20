Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P8ZGc-0000WT-Fl
	for linux-mtd@lists.infradead.org; Wed, 20 Oct 2010 14:03:47 +0000
Received: by pvg3 with SMTP id 3so776078pvg.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Oct 2010 07:03:44 -0700 (PDT)
Message-ID: <4CBEF6BA.8080103@gmail.com>
Date: Wed, 20 Oct 2010 07:03:38 -0700
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PATCH 2/2] mtd-utils: nanddump: add 64-bit support, utilize
	libmtd
References: <1287557125-2672-1-git-send-email-computersforpeace@gmail.com>
	<1287557125-2672-2-git-send-email-computersforpeace@gmail.com>
	<AANLkTikXF5CV8SFOC5Ygzw4fNBvgzbifQK2eeH7D1bbM@mail.gmail.com>
In-Reply-To: <AANLkTikXF5CV8SFOC5Ygzw4fNBvgzbifQK2eeH7D1bbM@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mike,

On 10/20/2010 12:01 AM, Mike Frysinger wrote:
> On Wed, Oct 20, 2010 at 02:45, Brian Norris wrote:
>> ...
>> -static unsigned long   start_addr;             // start address
>> ...
>> -static bool            forcebinary = false;    // force printing binary to tty
...
>> +static unsigned long long      start_addr;             // start address
...
>> +static bool                    forcebinary = false;    // force printing binary to tty
> 
> only one of these lines are functional.  please fold the rest into
> your "style fixup" patch.

True, except that they are not "style fixups" until after start_addr has
a longer data type (pun intended). I'll respin though.

>> @@ -480,7 +479,7 @@ int main(int argc, char * const argv[])
>>                        if (noskipbad)
>>                                continue;
>>                        do {
>> -                               if ((ret = ioctl(fd, MEMGETBADBLOCK, &offs)) < 0) {
>> +                               if ((ret = 0 /*ioctl(fd, MEMGETBADBLOCK, &offs)*/) < 0) {
>>                                        perror("ioctl(MEMGETBADBLOCK)");
>>                                        goto closeall;
>>                                }
> 
> doesnt seem to belong.  then again, none of the changes to this file
> look like they belong in this patch.

Wow, I really thought I had fixed this. Sorry, I will definitely respin.
I must have been in a hurry to send this out.

Still, despite my inability/failure to fully proofread my patches, most
of the patch *is* intentional and *does* belong, IMO. I will try to
document it better in the next patch description, but do you have
specifics on what you meant?

Thanks,
Brian
