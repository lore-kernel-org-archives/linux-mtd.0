Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by casper.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MUxJ1-00084m-D3
	for linux-mtd@lists.infradead.org; Sun, 26 Jul 2009 06:34:04 +0000
Message-ID: <4A6BF7C1.8090405@nokia.com>
Date: Sun, 26 Jul 2009 09:29:21 +0300
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Jamie Lokier <jamie@shareable.org>
Subject: Re: UBIFS robustness questions
References: <200907241600.54640.manningc2@actrix.gen.nz>
	<4A695819.7000705@nokia.com> <4A697DCC.2010302@nokia.com>
	<4A6986FC.6070006@nokia.com> <20090724233936.GP27755@shareable.org>
In-Reply-To: <20090724233936.GP27755@shareable.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Charles Manning <manningc2@actrix.gen.nz>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jamie Lokier wrote:
> Adrian Hunter wrote:
>> Sorry to drag this out but it seems like it can be done with symlinks
> 
> That's right.  It should be powerfail safe.
> Don't forget to "rm -fr version1" at the end :-)
> 
> However, if you are looking to use this for atomic update of a
> directory while there are programs still running which use the
> directory, it won't work.
> 
> You can't delete the old directory, because programs might still be
> inside it...

Are you sure about that.  I can do this:

/ # mkdir test2
/ # cd test2
/test2 # cp /bin/bash .
/test2 # ls -al
drwxr-xr-x    2 root     root          224 Jan  3 22:20 .
drwxrwxrwx   25 root     root         1768 Jan  3 22:20 ..
-rwxr-xr-x    1 root     root       612764 Jan  3 22:20 bash
/test2 # ./bash -c "sleep 30;echo Done" &
/test2 # rm bash
/test2 # cd ..
/ # rmdir test2
/ # ps | grep bash
 1261 root      2500 S    ./bash -c sleep 30;echo Done 
/ # 
/ # 
/ # Done

[2] + Done                       ./bash -c "sleep 30;echo Done"
