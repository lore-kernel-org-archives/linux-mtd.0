Received: from smtp.parrot.fr ([213.41.120.202])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HJ6UE-000390-3g
	for linux-mtd@lists.infradead.org; Mon, 19 Feb 2007 06:15:23 -0500
Message-ID: <45D986C5.9080805@parrot.fr>
Date: Mon, 19 Feb 2007 12:15:17 +0100
From: Matthieu CASTET <matthieu.castet@parrot.fr>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: jffs2 Erase Block Summary overhead
References: <45D47C92.8080908@parrot.fr>	<1171879537.7600.5.camel@pmac.infradead.org>
	<45D982F2.6050804@parrot.fr>
In-Reply-To: <45D982F2.6050804@parrot.fr>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

Matthieu CASTET a écrit :
> Hi,
> 
> David Woodhouse a écrit :
>> There's a lot of redundant information in the summary; I think we could
>> halve it fairly easily.
> That would be great :)
> 
>> I don't believe your 20% figure though -- that's
>> too high. You really can't rely on the output of df.
>>
After an accurate benchmark it is more 15 % than 20%, but it still big.

> But the jffs2 layer say "no space left on device", so the it is really full.
> 
> For more information on the test procedure, I fill the jffs2 filesystem 
> with someting like :
> "i=0; while true; do dd if=/dev/urandom of=file.$i count=1024; 
> i=$(($i+1));done"
> And I can create only 93 complete files, a incomplete file of 430 KB 
> (and there should be 4 MB taken file others files).
> 
> 
> May be I am on a worse test case ?
> 
> If I remove "Erase Block Summary", I can really fill the jffs2 up to 
> 60MB [1] instead of 51MB.
> 
> Thanks,
> 
> Matthieu
> 
> 
> [1]
> 
> # time mount /dev/mtdblock3 -t jffs2 /tmp/mnt/ ; time cat 
> /tmp/mnt/root/file.1 > /dev/null ; du -sh /tmp/mnt; df
> real    0m 11.91s
> user    0m 0.00s
> sys     0m 11.91s
> real    0m 0.36s
> user    0m 0.01s
> sys     0m 0.35s
> 59.8M   /tmp/mnt
> Filesystem                Size      Used Available Use% Mounted on
> /dev/ram0                 4.4M      4.4M         0 100% /
> none                      7.0M     16.0k      7.0M   0% /tmp
> none                      7.0M     16.0k      7.0M   0% /tmp
> tmpfs                     7.0M     16.0k      7.0M   0% /tmp
> /dev/mtdblock3           61.5M     60.9M    640.0k  99% /tmp/mnt
> 
