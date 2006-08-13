Received: from anchor-post-35.mail.demon.net ([194.217.242.85])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GCK1L-0002Pu-Sk
	for linux-mtd@lists.infradead.org; Sun, 13 Aug 2006 13:45:11 -0400
Message-ID: <000e01c6bf00$3acdd130$c9fea8c0@Catherine>
From: "Catherine Smith" <catherine@arrows.demon.co.uk>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>,
	"John" <john@arrows.demon.co.uk>
References: <Pine.LNX.4.33.0608131059220.32638-100000@arrows.demon.co.uk>
	<44DF16CC.3070708@yandex.ru>
Subject: Re: OneNAND - Cannot mount jffs2 partition
Date: Sun, 13 Aug 2006 18:45:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=response
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks Artem.


> John wrote:
>> Questions:
>>   Is this a suitable pair of commands?
>>    $ flash_eraseall -j /dev/mtd5
>>    $ mount -t jffs2 /dev/mtdblock5 /mnt/onenand
> Yeah, I believe this is the right commands and should work.
>
>
>>   What is the likely underlying cause of the error message
>>       "Cowardly refusing to erase blocks on filesystem with
>>        no valid JFFS2 nodes"
> Hmm, JFFS2 is complaining that you feed it with a flash which is neither 
> empty nor contains a valid JFFS2 FS image.
>
> Try to avoid using -j and see what happens. You also may try to enable 
> JFFS2's debugging prints.
>
If I don't use the -j, it seems to work, though with a few warnings.
For example:
  $ flash_eraseall /dev/mtd5
  Eraseing 64 Kibyte @ 7f0000 -- 99 % complete
  $ mount -t jffs2 /dev/mtdblock5 /mnt/onenand
  Eep. no valid nodes for ino #1

Then I can create files in /mnt/onenand, and copy them around or calculate a 
few signatures. All is well.
Once, when I tried to mount after a power cycle, it said:
  jffs2_get_inode_nodes(): CRC failed on node at 0x002dd7c8: Read 
0xffffffff, calculated 0x20f0e445

Are these warnings, the Eep and the CRC failure, typical and harmless,
or should I take a keen interest?

>
> -- 
> Best Regards,
> Artem B. Bityutskiy,
> St.-Petersburg, Russia.
>
Regards,
John Smith
Lancashire, England 
