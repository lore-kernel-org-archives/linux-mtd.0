Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F11FCE79DE
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Sep 2023 15:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:
	Message-ID:Cc:To:From:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Nfyo8qXST6lDO0W/pVqLiT/XbRMj5qFdM2Ifwk//wDw=; b=pRI
	mcx0LHeZ8iwvgmo3UGsyESp1JeTeAivG7yRHM0uD9nkjkXgT8xsZs+PziIV2Ghvpj7e4wIYCjkqdi
	UFI4AwWPIsi4j1/B6dMjSlsBHU0+0TIkEWi8a3wZoNS5PTtC1caCWKNtynVIrih8F2IQJ4LACDcCn
	kpRDPXdx+UvavZtY5Wzw0eJKFHk2iBMfgux/EklqB1lMbyoUHhy4H7M8gLwL/jlE9vVHN6a+hGoo8
	q9utW666xfDDTKCK0rgyfhqeCmbmfI65qcHCoy965JF6Qzk7IvWhVzUUwEr4qR8xOKSJ4OodwnLcN
	juQdaFiRrOb/TiicGgtxot6edGndpUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiypH-003SkK-27;
	Wed, 20 Sep 2023 15:09:15 +0000
Received: from mail.robart.cc ([81.10.172.252] helo=srv-mta-01.robart.cc)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiypD-003SjO-0v
	for linux-mtd@lists.infradead.org;
	Wed, 20 Sep 2023 15:09:13 +0000
Received: from localhost (localhost [127.0.0.1])
	by srv-mta-01.robart.cc (Postfix) with ESMTP id 2F7F71C068F;
	Wed, 20 Sep 2023 17:09:05 +0200 (CEST)
Received: from srv-mta-01.robart.cc ([127.0.0.1])
	by localhost (srv-mta-01.robart.cc [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id egkub_bOREIn; Wed, 20 Sep 2023 17:09:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by srv-mta-01.robart.cc (Postfix) with ESMTP id F36B41C06FF;
	Wed, 20 Sep 2023 17:09:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 srv-mta-01.robart.cc F36B41C06FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=robart.cc;
	s=B016B336-104E-11EA-8E2D-E36DD02BB770; t=1695222545;
	bh=UPkH2hzsNMoa65MD1CU+liwk9AkcIWSLTYPXYqu/r5s=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=MR8d0mKDF8lXJPWCNvJbS/D7irqmPf9utVFr4Wnjyzthkp52D/hanpwClKbc3Hic4
	 Vfc6w6mXOsp+enOYwPgoDsMPMQZVi0m8NlLxmcENo9+z/j7Z8eCNWhobZO54pwuZ+3
	 6dGR9Tf+mLZCpY7IEE6yYZSsxgX1cuDvOYPqc5P6K1w1vfrt3XxEsYIIjfkoy3U5up
	 cYr2QsWo9TR4dnpt9JDW3KW6a+j7QvCPsS8YMqR+RbCmAdtpdDZpPz7EIzYXkVsxa7
	 gTxjFx85K9mU6Zcoo6SVQhiQQcLv3reRgO9T8HYdFmtddUuBC5Dqlb0xnoija3c4qv
	 czZSSUj8yaeeA==
X-Virus-Scanned: amavisd-new at srv-mta-01.robart.cc
Received: from srv-mta-01.robart.cc ([127.0.0.1])
	by localhost (srv-mta-01.robart.cc [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 0csNhcIjSssZ; Wed, 20 Sep 2023 17:09:04 +0200 (CEST)
Received: from srv-mda-01.robart.cc (srv-mda-01.intern.robart.cc [10.0.10.21])
	by srv-mta-01.robart.cc (Postfix) with ESMTP id C56D81C068F;
	Wed, 20 Sep 2023 17:09:04 +0200 (CEST)
Date: Wed, 20 Sep 2023 17:09:04 +0200 (CEST)
From: Roland Ruckerbauer <roland.ruckerbauer@robart.cc>
To: linux-mtd@lists.infradead.org
Cc: Manuel Dipolt <manuel.dipolt@robart.cc>
Message-ID: <1638777819.2925845.1695222544742.JavaMail.zimbra@robart.cc>
Subject: ubifs: absurdly large directory inode size (possibly race condition
 / underflow)
MIME-Version: 1.0
X-Originating-IP: [10.0.20.3]
X-Mailer: Zimbra 9.0.0_GA_4509 (ZimbraWebClient - FF118 (Linux)/9.0.0_GA_4509)
Thread-Index: 6F6NUdTYnD1e/Th5jijTCoaEdN6Vsw==
Thread-Topic: ubifs: absurdly large directory inode size (possibly race condition / underflow)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_080911_983858_489A1AE1 
X-CRM114-Status: GOOD (  13.02  )
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
Reply-To: Roland Ruckerbauer <roland.ruckerbauer@robart.cc>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Greetings, 

I have observed some strange behavior in a UBIFS filesystem, and I wanted to ask if this is known, or unexpected.
For reference, I am using latest upstream 4.19 kernel on an embedded system, with the filesystem in question being encrypted with fscrypt.

When I stat the directory in question it shows the following: 

File: ./datastorage
  Size: 18446744073709550408    Blocks: 0          IO Block: 4096   directory
Device: 27h/39d Inode: 1168        Links: 2
Access: (0755/drwxr-xr-x)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2023-09-19 13:30:21.000000000
Modify: 2023-09-20 14:44:09.000000000
Change: 2023-09-20 14:44:09.000000000

As you can see, the size of the directory inode is absurdly large. Its actually quite close to 2^64, which makes me think there is some kind of
race / underflow happening in regards to the stored inode size metadata. 

Apart from this observation, the filesystem in question seems to be healthy, no errors, also no unexpected errors from the applications using it.
As far as I am aware, the problem only manifests itself as corrupted metadata, when calling e.g. stat.
When I move around the folder on the same filesystem, the problem persists. When any files are added / deleted from the directory, it changes the
directory size, but its still corrupted and close to the same value. A reboot of the system shows that this corruption is indeed persistent on the
filesystem.

This began to happen daily (but did happen before), since I did a small code change to an application running on the system.

Here is some pseudocode which I suspect might be related to the problem. Obviously I removed a lot of the error handling etc... to make it more clear.
In essence I refactored some code to be more atomic with its changes to files.

--------------------------------------------------------------------------------------------------------
// Open the file for writing, but make it an anon inode to prevent having incomplete
// files in the filesystem when e.g. crashing
int fd = open(path, O_WRONLY | O_CLOEXEC | O_TMPFILE, 0644);

...

write(fd, buffer, buffer_len);

...

// Unfortunately we need to unlink the destination first, because AT_LINK_REPLACE is not available
// This is not atomic, so in theory someone can re-create the file after its deleted here.
// I think its ok to let the write fail in this case.
unlink(path);

linkat(AT_FDCWD, old_path, AT_FDCWD, path.c_str(), AT_SYMLINK_FOLLOW);

close(fd);
--------------------------------------------------------------------------------------------------------


Is someone aware of a problem like this? I did not find anything similar to this particular problem, despite searching for some time. Even for
other filesystems, not just ubifs. I have expected this to work without issues, its not some rare patter to use O_TMPFILE like this. After
all the linkat() and open() manpages both mention this approach.

Could it be that the unlink() followed by the linkat() is somehow resulting in a race condition in the kernel?

Best regards,
Roland Ruckerbauer

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
