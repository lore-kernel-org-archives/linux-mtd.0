Received: from [202.141.68.3] (helo=desh.cse.iitd.ernet.in)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D8STY-0002qn-4U
	for linux-mtd@lists.infradead.org; Mon, 07 Mar 2005 19:21:32 -0500
Message-ID: <422C4B65.50804@kritikalsolutions.com>
Date: Mon, 07 Mar 2005 18:09:01 +0530
From: Narinder Kumar <narinder@kritikalsolutions.com>
MIME-Version: 1.0
To: Andrew Victor <andrew@sanpeople.com>
References: <4222D35B.7070909@kritikalsolutions.com>
	<1109667284.4420.18.camel@fuzzie.sanpeople.com>
In-Reply-To: <1109667284.4420.18.camel@fuzzie.sanpeople.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: SPI DataFlash interfacing using 2.4.27-vrs1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Mr. Andrew,

               I tried out the solution that you mentioned in the last 
mail (please look into the mail below) but still i am not able to reach 
at a safe state. It did helped a bit in the sense that now my flash code 
recovers from CRC errors sometimes but sometimes it fails too and it 
fails because of Data corruption and when it fails it aborts my 
application and thereafter i have to start from the beginning i.e 
erasing the flash completely and then putting the application again.

Can you please guide me in a bit detailed manner ?
Which version of MTD is being used by you ?

I tried out  mtd-snapshot-20050217.tar and latest one also but still not 
able to get rid of my problem.
I installed mtd using patchin.sh script with "-c -j" options and i 
copied an older version(1.60) of mtdchar.c file as the newer one was 
giving errors during kernel compilation and when i replaced it with 
older version mtdchar then the kernel compiled succesfully.
If there is something crucial that i am missing out please let me know. 
I hope you have not done any major changes in the patches itself to get 
it working, if that is the case can you please update me where from can 
i get the working patches for 2.4.27-vrs1 or if you can forward the 
patches to me , that will be great.

Regards,
Narinder


Andrew Victor wrote:

>hi Narinder,
>
>  
>
>>         Did anyone on the group sucessfully interfaced a JFFS2 
>>partition on SPI DataFlash on Atmel's AT91RM9200 DK using  kernel 2.4.26 
>>? I have been able to mount the partition but read/write was giving CRC 
>>errors.
>>    
>>
>
>I'm running JFFS2-on-DataFlash successfully on 2.4.27-vrs1.
>
>1) You will need to download the latest CVS version of the MTD/JFFS2
>code from cvs.infradead.org (see http://www.linux-mtd.infradead.org/ for
>instructions).
>
>2) Read the INSTALL file and then run the ./patchin.sh script
>
>3) There are some incompatibilities with 2.4 kernels, but they're not
>difficult to fix.  This might help:
>http://lists.infradead.org/pipermail/linux-mtd/2004-December/011039.html
>
>4) Configure your kernel and enable "JFFS2 write-buffering support"
>under Filesystems->JFFS2.
>
>
>Regards,
>  Andrew Victor
>
>
>
>
>
>  
>
