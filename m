Received: from smtp.ustc.edu.cn ([202.38.64.16] helo=ustc.edu.cn)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JBl2q-00031a-Jx
	for linux-mtd@lists.infradead.org; Mon, 07 Jan 2008 06:01:15 +0000
Message-ID: <399685679.09967@ustc.edu.cn>
Message-ID: <4781BFA6.4010207@mail.ustc.edu.cn>
Date: Mon, 07 Jan 2008 13:59:02 +0800
From: shizheng <shizheng@mail.ustc.edu.cn>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org, vinit.agnihotri@gmail.com
Subject: Re: why ubimkvol can't recognize /dev/ubi0?
References: <399685257.10363@ustc.edu.cn>
In-Reply-To: <399685257.10363@ustc.edu.cn>
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> By default nandsim creates device of 8MB.
>   
~~~~~~ Sorry, this shold be 128MB :-)
> # cat /proc/mtd
> dev:	size	erasesize  name
> mtd0:	08000000 00004000  "NAND simulator partition 0"
>
> >/
> />/ Vinit Agnihotri wrote:
> />>/ yeah & 1 more...use mtdram instead of nandsim.
> />>/ modprobe mtdram=40960 will create mtd device of size 40MB,
> />>/ besides that you can write small tool for creating & deleting volumes,
> />>/ its simple.
> />>/ you can find ioctl's & structures code in include/mtd/ubi-user.h.
> />>/
> />>/ --Vinit.
> />>/
> />>/ On Jan 6, 2008 1:23 PM, Vinit Agnihotri <vinit.agnihotri at gmail.com <http://lists.infradead.org/mailman/listinfo/linux-mtd>> wrote:
> />>/     
> />>>/ You have loaded Nandsim with default, may be theres not enough space
> />>>/ on nandsim to create 20Mib volume,
> />>>/ I guess by default nandsim creates device of 8MB. you can check it by
> />>>/ looking a /proc/mtd.
> />>>/ so try creating volume of smaller size or pass appropriate module
> />>>/ parameters to nandsim module,
> />>>/ do a modinfo nandsim or straight way have look in its code, I assume
> />>>/ that you have proper privileges to run ubimkvol.
> />>>/ still I dont have justification for that strange error, but try this out.
> />>>/
> />>>/ --Vinit.
> />>>/
> />>>/
> />>>/ On Jan 6, 2008 11:14 AM, Ê±Õý <shizheng at mail.ustc.edu.cn <http://lists.infradead.org/mailman/listinfo/linux-mtd>> wrote:
> />>>/       
> />>>>/ Hi all,
> />>>>/ I wanna have a try of ubifs on nandsim, and do as what the ubifs wiki
> />>>>/ tells me
> />>>>/ (http://osl.sed.hu/wiki/ubifs/index.php/Download_the_source).
> />>>>/
> />>>>/ 1. compile, install and boot the new kernel(2.6.23)
> />>>>/ the configuration option for ubi and nandsim is default turned on as module.
> />>>>/
> />>>>/
> />>>>/ 2. make the mtd-utils to produce ubimkvol
> />>>>/
> />>>>/ 3. create a ubi when I got the error
> />>>>/ # modprobe nandsim
> />>>>/ # modprobe ubi mtd=0
> />>>>/ # ls /dev/ubi0 -l
> />>>>/ crw-rw---- 1 root root 253, 0 2007-12-25 01:46 /dev/ubi0
> />>>>/ # ls /sys/class/ubi -l
> />>>>/ drwxr-xr-x 3 root root 0 2007-12-25 01:46 ubi0
> />>>>/ -r--r--r-- 1 root root 4096 2007-12-25 01:49 version
> />>>>/ # ubimkvol /dev/ubi0 -n 0 -N test -s 20MiB
> />>>>/ libubi error: readdir failed on "/sys/class/ubi"
> />>>>/ readdir: No such file or directory
> />>>>/ ubimkvol error: "/dev/ubi0" is not an UBI device node
> />>>>/
> />>>>/ it's so strange about the readdir failure, because there is the ubi0
> />>>>/ entry in sysfs.
> />>>>/
> />>>>/ did I miss any step, such as kernel configuration or mtd-tools installation?
> />>>>/
> />>>>/ Thanks a lot!
> />>>>/
> />>>>/ best wishes, shizheng
> />>>>/
> />>>>/
> />>>>/ ______________________________________________________
> />>>>/ Linux MTD discussion mailing list
> />>>>/ http://lists.infradead.org/mailman/listinfo/linux-mtd/
> />>>>/
> />>>>/         
> />>>/
> />>>/ --
> />>>/ Life is so short. So, follow some rules. Forgive quickly, believe
> />>>/ slowly, love truly, laugh loudly & never avoid anything that makes U
> />>>/ smile.
> />>>/
> />>>/       
> />>/
> />>/
> />>
