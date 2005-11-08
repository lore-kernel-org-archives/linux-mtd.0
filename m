Received: from romsoft.iasi.rdsnet.ro ([82.77.20.73] helo=mail.rms.ro)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EZVOQ-0005PZ-3A
	for linux-mtd@lists.infradead.org; Tue, 08 Nov 2005 10:28:18 -0500
Message-ID: <4370C404.3030301@rms.ro>
Date: Tue, 08 Nov 2005 17:28:04 +0200
From: Edgar Grimberg <edgar.grimberg@rms.ro>
MIME-Version: 1.0
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
References: <4370A357.5060805@rms.ro> <4370B863.9030103@yandex.ru>
In-Reply-To: <4370B863.9030103@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: "Skipping dirent" message
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityutskiy wrote:

> Edgar Grimberg wrote:
>
>> Hi,
>>
>> I have eCos and JFFS, and I get the following message from JFFS debug 
>> output:
>>
>> <7>Skipping dirent: "2007-01-08 08-27", ino #10, type 8, because 
>> curofs 2 < offset 3
>
> Don't enable debug output if you don't want to see this message :-)

No can do. I am testing the application and I like to see the engine 
running. :-)

>
>> I am not sure what it means, but the fact is that I have the 
>> "2007-01-08 08-27" directory and I want to opendir and readdir it.
>
> The message just says that the the direntry was skipped because 
> jffs2_readdir() was called with f_pos = 3, probably someone explicitly 
> wanted to read directory from offset = 3 (for example by means of 
> calling seek(fd, 3 SEEK_SET) to the parent directory). Try to sett the 
> position to zero.

I have to see who is the guilty one. Thanks for the response.

Best regards,
Edgar
