Received: from [213.239.212.131] (helo=mail2.syneticon.net)
	by pentafluge.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F0jpM-00076M-V8
	for linux-mtd@lists.infradead.org; Sun, 22 Jan 2006 18:20:41 +0000
Message-ID: <43D3CCD8.1000402@wpkg.org>
Date: Sun, 22 Jan 2006 19:20:08 +0100
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
References: <43C7930F.3030807@wpkg.org>	<1137707169.7181.58.camel@nighteyes.site>
	<43D29696.2020904@wpkg.org>
In-Reply-To: <43D29696.2020904@wpkg.org>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: how to mount a 256 MB jffs2 image (without using 256 MB of	RAM)?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Tomasz Chmielewski schrieb:
> Jeff Angielski schrieb:
> 
>> On Fri, 2006-01-13 at 12:46 +0100, Tomasz Chmielewski wrote:
>>
>>> Are there any alternative ways to mount a jffs2 image, so that it 
>>> doesn't take so much RAM?
>>
>>
>>
>> You might want to take a look at this under "Procedure":
>>
>> http://www.handhelds.org/moin/moin.cgi/FamiliarBackupHowto
>>
>> Google is your friend....  :)
> 
> 
> I googled long enough, then I asked at this list as I didn't found :)
> 
> It works, well, almost.
> 
> Why the image mounted this way is read only?

Well, not really "read only", but whenever I try to remove anything, the 
system says "not enough space", and refuses to remove files (or add 
them), which results in the filesystem being read-only.


-- 
Tomasz Chmielewski
http://wpkg.org
