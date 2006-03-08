Received: from ms01.sssup.it ([193.205.80.99] helo=sssup.it)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FGyDs-00068B-EH
	for linux-mtd@lists.infradead.org; Wed, 08 Mar 2006 07:57:05 -0500
Message-ID: <440ED49A.2060502@gandalf.sssup.it>
Date: Wed, 08 Mar 2006 13:56:58 +0100
From: Michael Trimarchi <trimarchi@gandalf.sssup.it>
MIME-Version: 1.0
To: Josh Boyer <jwboyer@gmail.com>
References: <20060307200320.vret812nko8k0k4g@feanor.sssup.it>
	<625fc13d0603071112w2b846443n466c8cc77cb37211@mail.gmail.com>
In-Reply-To: <625fc13d0603071112w2b846443n466c8cc77cb37211@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

s3c2440
128MB nand
full file system

jffs2 and jffs2+Erase Block Summary (EBS)

regards
Michael


Josh Boyer wrote:

>On 3/7/06, trimarchi@gandalf.sssup.it <trimarchi@gandalf.sssup.it> wrote:
>  
>
>>Hi all,
>>I need to know the order of magnitude of time spent to mount a NAND of 128MB
>>using a jffs2 filesystem.
>>    
>>
>
>That's a pretty vague question, so I'll give you a vague answer:
>
>It will take less than 3 years to mount a NAND of 126MiB using a JFFS2
>filesystem.
>
>If you specify more information, perhaps you'll get a better answer. 
>Things like the type of processor, the type of NAND flash, how full
>the filesystem is, whether or not the Summary option is on, etc. all
>have a direct impact to your question.
>
>josh
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>  
>
