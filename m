Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OsvLW-0005qV-VD
	for linux-mtd@lists.infradead.org; Tue, 07 Sep 2010 10:24:11 +0000
Message-ID: <4C8612B9.4060305@nokia.com>
Date: Tue, 07 Sep 2010 13:23:53 +0300
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: NOTE! mkfs.ubifs
References: <1283848562-19564-1-git-send-email-dedekind1@gmail.com>
	<1283850698.2979.25.camel@localhost>
In-Reply-To: <1283850698.2979.25.camel@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Arno Steffen <arno.steffen@googlemail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Tue, 2010-09-07 at 11:36 +0300, Artem Bityutskiy wrote:
>> From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
>>
>> When mkfs.ubifs is used with -r dir, it does not make the root UBIFS
>> inode uid/gid/permissions to be equivalent to dir's permissions, but
>> it makes root inode permissions to be equivalent to uid = git = 0
>> (root) and permissions = u+rwx go+rx.
>>
>> This patch changes the behavior and makes mkfs.ubifs use the
>> permissions of the directory containing the original files on the host.
>> I.e., it will be <dir>'s uid/git/permissions if case of mkfs.ubifs
>> -r <dir>.
>>
>> This patch is a bit dangerous because it changes the behavior and may
>> have security implications if someone used the older version, relied
>> on this bug, and upgrades to the newer version.
>>
>> Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> 
> All mkfs.ubifs users should take a look at this - should we apply this
> patch? I'm still in doubt...
> 

I do not agree with changing the behaviour.  It should be a new option,
and you could add a warning explaining what the root inode permissions
are and why e.g.

	Warning: Option ?? not used. Setting root inode permissions to blah

	Warning: Option ?? used. Setting root inode permissions to blah
