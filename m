Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15954CE79A9
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Sep 2023 20:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kd1YvrSh1T9PPjuLSdIHjUgMlYbTw7pYErGuOv8+UZY=; b=MsyEHi3LyXHGKb
	3GXn5CfS0a4pDwj1rIG4+90TLDZHhpepXacUS7QmqiIMeQIw6JlUp4vrQL1r0h/ITZA1F61qGfyLF
	9OgmOHpSWlcK4q/3EdkqfXFjor5P20VUJ4ZLWo+6GVqXBLAnKWgFn+4XQwQijm1PFHKQRLcelYFW5
	FG/anMlTzrXCI3e45lStEuYLjzMzdhVs2a1QU3yCmWl2cvCKImiEgEAyrXywYtXtuk6xHrrPqv6KX
	1P3EzOylS7FtxKpAyI53PPsrTkBVNhvI0VNSlWfH47tukB6SaJ640F4w3UYMpzTyw5X5LzdyZObkZ
	zYCJmNiCmvGC0GnUVs0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qih3u-001DTY-0V;
	Tue, 19 Sep 2023 20:11:10 +0000
Received: from mail.cs.ucla.edu ([131.179.128.66])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qih3q-001DRL-34;
	Tue, 19 Sep 2023 20:11:08 +0000
Received: from localhost (localhost [127.0.0.1])
	by mail.cs.ucla.edu (Postfix) with ESMTP id 7F8E73C00D194;
	Tue, 19 Sep 2023 13:10:50 -0700 (PDT)
Received: from mail.cs.ucla.edu ([127.0.0.1])
	by localhost (mail.cs.ucla.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id AN80LNh6AqGG; Tue, 19 Sep 2023 13:10:50 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.cs.ucla.edu (Postfix) with ESMTP id ED2803C00D193;
	Tue, 19 Sep 2023 13:10:49 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.cs.ucla.edu ED2803C00D193
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs.ucla.edu;
	s=9D0B346E-2AEB-11ED-9476-E14B719DCE6C; t=1695154250;
	bh=rkg9tbxTq6pJj5csNug/eDfUxuv8dlZEs8ZxbrqQ+Bs=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=e7FwFS1NK+ibkS0cG53EL8AQUGclUFwkekbt01t0RrGTfteamSqMsn/mn3buwjYqP
	 Ss5aVs4mQTQ9vMjU5SbCpefiDChbloDYu1HfklTquHXpMe72pT4M6hvyzCQRVAncyf
	 WVOHo5BHpqQpInzk0XI1vkjThUjzXxG9DeoOO1hJGEZWIEF2xR1lMhg3hNLw6eelH3
	 vfkIEJZDbK4SvwqlaNARiGG/pYA5z0FuwJeduSFWqHIxx4VzcDeiRS6F9+AWa/lvRd
	 UJDA/fA+mrJldEyknr58vHs/9vvVt/ptANUNnDyTfqTMtd8U29s7w3jEOKzFb4QdS+
	 p/bV3Yp4QSW6g==
X-Virus-Scanned: amavisd-new at mail.cs.ucla.edu
Received: from mail.cs.ucla.edu ([127.0.0.1])
	by localhost (mail.cs.ucla.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id gYfshQpOC6VB; Tue, 19 Sep 2023 13:10:49 -0700 (PDT)
Received: from [192.168.254.12] (unknown [47.147.225.57])
	by mail.cs.ucla.edu (Postfix) with ESMTPSA id C37643C00D18B;
	Tue, 19 Sep 2023 13:10:48 -0700 (PDT)
Message-ID: <c8315110-4684-9b83-d6c5-751647037623@cs.ucla.edu>
Date: Tue, 19 Sep 2023 13:10:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Jeff Layton <jlayton@kernel.org>, Bruno Haible <bruno@clisp.org>,
 Jan Kara <jack@suse.cz>, Xi Ruoyao <xry111@linuxfromscratch.org>,
 bug-gnulib@gnu.org
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov
 <lucho@ionkov.net>, Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>,
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
 David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>,
 Ilya Dryomov <idryomov@gmail.com>, Jan Harkes <jaharkes@cs.cmu.edu>,
 coda@cs.cmu.edu, Tyler Hicks <code@tyhicks.com>, Gao Xiang
 <xiang@kernel.org>, Chao Yu <chao@kernel.org>, Yue Hu <huyue2@coolpad.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, Jan Kara <jack@suse.com>,
 Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Jaegeuk Kim <jaegeuk@kernel.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Miklos Szeredi <miklos@szeredi.hu>, Bo b Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Anna Schumaker <anna@kernel.org>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, Mike Marshall
 <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@chromium.org>,
 Iurii Zaikin <yzaikin@google.com>, Steve French <sfrench@samba.org>,
 Paulo Alcantara <pc@manguebit.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Richard Weinberger <richard@nod.at>, Hans de Goede <hdegoede@redhat.com>,
 Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>,
 Amir Goldstein <l@gmail.com>, "Darrick J. Wong" <djwong@kernel.org>,
 Benjamin Coddington <bcodding@redhat.com>, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, v9fs@lists.linux.dev,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org,
 ceph-devel@vger.kernel.org, codalist@coda.cs.cmu.edu,
 ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-nfs@vger.kernel.org, ntfs3@lists.linux.dev,
 ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-mtd@lists.infradead.org, linux-mm@kvack.org,
 linux-unionfs@vger.kernel.org, linux-xfs@vger.kernel.org
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230919110457.7fnmzo4nqsi43yqq@quack3>
 <1f29102c09c60661758c5376018eac43f774c462.camel@kernel.org>
 <4511209.uG2h0Jr0uP@nimes>
 <08b5c6fd3b08b87fa564bb562d89381dd4e05b6a.camel@kernel.org>
From: Paul Eggert <eggert@cs.ucla.edu>
Organization: UCLA Computer Science Department
Subject: Re: [PATCH v7 12/13] ext4: switch to multigrain timestamps
In-Reply-To: <08b5c6fd3b08b87fa564bb562d89381dd4e05b6a.camel@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_131107_019059_03623546 
X-CRM114-Status: GOOD (  18.63  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2023-09-19 09:31, Jeff Layton wrote:
> The typical case for make
> timestamp comparisons is comparing source files vs. a build target. If
> those are being written nearly simultaneously, then that could be an
> issue, but is that a typical behavior?

I vaguely remember running into problems with 'make' a while ago 
(perhaps with a BSDish system) when filesystem timestamps were 
arbitrarily truncated in some cases but not others. These files would 
look older than they really were, so 'make' would think they were 
up-to-date when they weren't, and 'make' would omit actions that it 
should have done, thus screwing up the build.

File timestamps can be close together with 'make -j' on fast hosts. 
Sometimes a shell script (or 'make' itself) will run 'make', then modify 
a file F, then immediately run 'make' again; the latter 'make' won't 
work if F's timestamp is mistakenly older than targets that depend on it.

Although 'make'-like apps are the biggest canaries in this coal mine, 
the issue also affects 'find -newer' (as Bruno mentioned), 'rsync -u', 
'mv -u', 'tar -u', Emacs file-newer-than-file-p, and surely many other 
places. For example, any app that creates a timestamp file, then backs 
up all files newer than that file, would be at risk.


> I wonder if it would be feasible to just advance the coarse-grained
> current_time whenever we end up updating a ctime with a fine-grained
> timestamp?

Wouldn't this need to be done globally, that is, not just on a per-file 
or per-filesystem basis? If so, I don't see how we'd avoid locking 
performance issues.


PS. Although I'm no expert in the Linux inode code I hope you don't mind 
my asking a question about this part of inode_set_ctime_current:

	/*
	 * If we've recently updated with a fine-grained timestamp,
	 * then the coarse-grained one may still be earlier than the
	 * existing ctime. Just keep the existing value if so.
	 */
	ctime.tv_sec = inode->__i_ctime.tv_sec;
	if (timespec64_compare(&ctime, &now) > 0)
		return ctime;

Suppose root used clock_settime to set the clock backwards. Won't this 
code incorrectly refuse to update the file's timestamp afterwards? That 
is, shouldn't the last line be "goto fine_grained;" rather than "return 
ctime;", with the comment changed from "keep the existing value" to "use 
a fine-grained value"?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
