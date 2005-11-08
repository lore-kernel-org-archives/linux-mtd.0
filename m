Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EZUct-0004DI-UW
	for linux-mtd@lists.infradead.org; Tue, 08 Nov 2005 09:39:28 -0500
Message-ID: <4370B863.9030103@yandex.ru>
Date: Tue, 08 Nov 2005 17:38:27 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Edgar Grimberg <edgar.grimberg@rms.ro>
References: <4370A357.5060805@rms.ro>
In-Reply-To: <4370A357.5060805@rms.ro>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Edgar Grimberg wrote:
> Hi,
> 
> I have eCos and JFFS, and I get the following message from JFFS debug 
> output:
> 
> <7>Skipping dirent: "2007-01-08 08-27", ino #10, type 8, because curofs 
> 2 < offset 3
Don't enable debug output if you don't want to see this message :-)

> I am not sure what it means, but the fact is that I have the "2007-01-08 
> 08-27" directory and I want to opendir and readdir it.
The message just says that the the direntry was skipped because 
jffs2_readdir() was called with f_pos = 3, probably someone explicitly 
wanted to read directory from offset = 3 (for example by means of 
calling seek(fd, 3 SEEK_SET) to the parent directory). Try to sett the 
position to zero.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
