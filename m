Return-Path: <SRS0=O0jx=BR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64AB7C433DF
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2020 13:43:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1398620866
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2020 13:43:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qn2kbS1v";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=micron.com header.i=@micron.com header.b="ZmItP/xC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1398620866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ppz2D4CQ6zSA/4HVN5WzV7Pg2jhQ9rwpbio9WkiAKDs=; b=Qn2kbS1vv0x+ykaVm2oAr+w9t
	E4M+gDPvRmeVJ/Ral6QOkfkssvD3e4DnFtNMQpJ93qU60hRR5TpCrJNGEjBydwEx4Zqg7vPtqgVJ9
	IqBdxm8O8srFKSlIleow9L8dOPTESG3QAn+F/fXfafY5E/eEHchyVH8ssAfeFNPcGNCI7fa1JUqeU
	ChB4RnK6Z9rvhBauAKVYh8Nerz5Z7BD1c/UvX6GLzH+anu1JpTpJoM4W6B1nN18EVw6+cQLDFkIrN
	M/l8nDCPNOgchfbdzuWqpruao8+pDpPdog49jEeg+/Q1DovAtDAfj5ELOKMZ/+gGk+zszZu7u/mOc
	NjCFd7AHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k42dE-0003CK-Mt; Fri, 07 Aug 2020 13:42:00 +0000
Received: from mail-dm6nam12on2045.outbound.protection.outlook.com
 ([40.107.243.45] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k42dD-0003Bv-2i
 for linux-mtd@lists.infradead.org; Fri, 07 Aug 2020 13:41:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P8uacvOl+w2qoa7qgzIovua/NH9z5lcjOQ2gNzFh42Pd/ZrsQVe7knGBT8jHPZmxYv55vGMb1+9NJnt4uxLXk7ueD91VRrSO6FVEe90966NoDQ3D5BzSTsBV92VPzEzgVMxIn0CXcYj9Co4MGbPA9dV5yqtMWs/JbQ8aF/Rt1RFI6Jjw/MgWXF8E4wC7qL7tvhiHxS8R8+GK5W7u6rPC8IUZmFxpaVnqXlLdQrOYLdkeHGlOjqjFF2IhRLGjzygxwdFAtFQA+9GfuBTL4wu4lVdlIUs4X3tGnQWpXW/qfjxKCeueqxXGvUCmx2d7DpE2d4R7rwmdRsPxzqk9ophelw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B56Fi+OpvHg5aOoikbXc1VFPUJTc2J5tUByeKBke0zA=;
 b=TXlXCd2H3sXwtPZmGn2Ga0n/aNmVKMwD3NbGPVuAGTZSrJ6KQKN4QNMG2M7hm9p66I9WKw//mLVnWPmiwd+fmKkbJxOvU+inVOL72xAb2jA0wFnAKvnyP1rcpa4pFwlbJ1USnkykpl4m97c5FbUba0zn4IJpzSFYrfd1dA5mIvfdih57uXxTBF6MzYiZeKOiBQzv2lH94jcH+MTxK790SFh7rjfOis7kvhYgrem1ZhlIhPWY/rwTu1dHxgNZLPUOqwwERPAIkIE/ttDNW4kUOXMbuQK+ax4AvPXOg/AYwvL42s6leKOPgeGJen6aTS9F8pI0yWFboT1iLMAQDEM52w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=micron.com; dmarc=pass action=none header.from=micron.com;
 dkim=pass header.d=micron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B56Fi+OpvHg5aOoikbXc1VFPUJTc2J5tUByeKBke0zA=;
 b=ZmItP/xCiW0GqXCAJI/wLVs4tVkBns2UoyWFvuiMisP82EVWJf1jdYfLEZeSaC3qxF7fFcY6Ouz45qopLHB7Khz9oldfwO+XzSHpOW+B6AxW6zUpHPFBXYif1Cb8maRpUiom9SoazKPh0k5dVjCN6JOdblNuGZx7P2bMkHbfPHA=
Received: from MN2PR08MB6397.namprd08.prod.outlook.com (2603:10b6:208:1aa::10)
 by BL0PR08MB5377.namprd08.prod.outlook.com (2603:10b6:208:2b::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Fri, 7 Aug
 2020 13:41:56 +0000
Received: from MN2PR08MB6397.namprd08.prod.outlook.com
 ([fe80::4020:f5ff:9394:1136]) by MN2PR08MB6397.namprd08.prod.outlook.com
 ([fe80::4020:f5ff:9394:1136%8]) with mapi id 15.20.3239.022; Fri, 7 Aug 2020
 13:41:56 +0000
From: "Shivamurthy Shastri (sshivamurthy)" <sshivamurthy@micron.com>
To: Thirumalesha Narasimhappa <nthirumalesha7@gmail.com>
Subject: RE: [EXT] [PATCH] mtd: spinand: micron: add support for MT29F2G01AAAED
Thread-Topic: [EXT] [PATCH] mtd: spinand: micron: add support for
 MT29F2G01AAAED
Thread-Index: AQHWWFRx8s+IuQkuokuJBjx7DXXxrKkszj/A
Date: Fri, 7 Aug 2020 13:41:56 +0000
Message-ID: <MN2PR08MB6397250EBF7AB4BE26938C30B8490@MN2PR08MB6397.namprd08.prod.outlook.com>
References: <20200712135942.10904-1-nthirumalesha7@gmail.com>
In-Reply-To: <20200712135942.10904-1-nthirumalesha7@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-rorf: true
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc3NoaXZhbXVy?=
 =?us-ascii?Q?dGh5XGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02?=
 =?us-ascii?Q?Yjg0YmEyOWUzNWJcbXNnc1xtc2ctYmZmYmEwYzQtZDhiMy0xMWVhLWIxZjUt?=
 =?us-ascii?Q?OTgzYjhmNzQ1MjUxXGFtZS10ZXN0XGJmZmJhMGM2LWQ4YjMtMTFlYS1iMWY1?=
 =?us-ascii?Q?LTk4M2I4Zjc0NTI1MWJvZHkudHh0IiBzej0iNDY3OSIgdD0iMTMyNDEyODEz?=
 =?us-ascii?Q?MTMwMDYwNTY0IiBoPSJSSHZHZFVsNmxRRnVkbFBmMmZHRzQ0aXg1bFE9IiBp?=
 =?us-ascii?Q?ZD0iIiBibD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQUFG?=
 =?us-ascii?Q?QUtBQUFVMDFPQ3dHeldBZk9NQ1h0VXJQRWk4NHdKZTFTczhTSVFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBSEFBQUFEZ0NRQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBRUJBUUFCQUFBQUJnNHo0UUFBQUFBQUFBQUFBQUFBQUo0QUFBQnRB?=
 =?us-ascii?Q?R2tBWXdCeUFHOEFiZ0JmQUc0QVlRQnVBR1FBWHdCd0FISUFhUUJ0QUdFQWNn?=
 =?us-ascii?Q?QjVBRjhBYXdCbEFIa0Fkd0J2QUhJQVpBQnpBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUcwQWFRQmpBSElBYndCdUFG?=
 =?us-ascii?Q?OEFiZ0JoQUc0QVpBQmZBSE1BWlFCakFHOEFiZ0JrQUdFQWNnQjVBRjhBYXdC?=
 =?us-ascii?Q?bEFIa0Fkd0J2QUhJQVpBQnpBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFB?=
 =?us-ascii?Q?QUNBQUFBQUFDZUFBQUFiZ0JoQUc0QVpBQmZBR2NBYkFCdkFHSUFZUUJzQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFC?=
 =?us-ascii?Q?dUFHRUFiZ0JrQUY4QWFBQnBBR2NBYUFCZkFHTUFid0J1QUdZQWFRQmtBR1VB?=
 =?us-ascii?Q?YmdCakFHVUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBRzRBWVFCdUFHUUFYd0J0?=
 =?us-ascii?Q?QUdFQWN3QnJBR2tBYmdCbkFGOEFiQUJoQUhrQVpRQnlBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFB?=
 =?us-ascii?Q?QUFBQ0FBQUFBQUNlQUFBQWJnQmhBRzRBWkFCZkFHMEFZUUIwQUdVQWNnQnBB?=
 =?us-ascii?Q?R0VBYkFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFB?=
 =?us-ascii?Q?QUJ1QUdFQWJnQmtBRjhBYlFCdkFHUUFkUUJzQUdVQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFHNEFZUUJ1QUdRQVh3?=
 =?us-ascii?Q?QndBSElBYndCakFHVUFjd0J6QUY4QVpRQnhBSFVBYVFCd0FHMEFaUUJ1QUhR?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFB?=
 =?us-ascii?Q?QUFBQUFDQUFBQUFBQ2VBQUFBYmdCaEFHNEFaQUJmQUhNQU1RQXpBREFBWHdC?=
 =?us-ascii?Q?a0FHVUFjd0JwQUdjQWJnQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0?=
 =?us-ascii?Q?QUFBQnVBR0VBYmdCa0FGOEFjd0F4QURNQU1BQmZBSEFBWVFCeUFIUUFZd0J2?=
 =?us-ascii?Q?QUdRQVpRQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUc0QVlRQnVBR1FB?=
 =?us-ascii?Q?WHdCekFERUFOQUF3QUY4QVpBQmxBSE1BYVFCbkFHNEFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFB?=
 =?us-ascii?Q?QUFBQUFBQUNBQUFBQUFDZUFBQUFiZ0JoQUc0QVpBQmZBSE1BTVFBMEFEQUFY?=
 =?us-ascii?Q?d0J3QUdFQWNnQjBBR01BYndCa0FHVUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFB?=
 =?us-ascii?Q?SjRBQUFCdUFHRUFiZ0JrQUY4QWN3QXhBRFVBTUFCZkFHUUFaUUJ6QUdrQVp3?=
 =?us-ascii?Q?QnVBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBRzRBWVFCdUFH?=
 =?us-ascii?Q?UUFYd0J6QURFQU5RQXdBRjhBY0FCaEFISUFkQUJqQUc4QVpBQmxBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFR?=
 =?us-ascii?Q?QUFBQUFBQUFBQ0FBQUFBQUNlQUFBQWJnQmhBRzRBWkFCZkFITUFNUUEyQURB?=
 =?us-ascii?Q?QVh3QmtBR1VBY3dCcEFHY0FiZ0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFB?=
 =?us-ascii?Q?QUFKNEFBQUJ1QUdFQWJnQmtBRjhBY3dBeEFEWUFNQUJmQUhBQVlRQnlBSFFB?=
 =?us-ascii?Q?WXdCdkFHUUFaUUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBRUFBQUFBQUFBQUFnQUFBQUFBIi8+PC9tZXRhPg?=
 =?us-ascii?Q?=3D=3D?=
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=micron.com;
x-originating-ip: [95.90.199.89]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 78c3ad11-6286-45eb-8d42-08d83ad7a6e5
x-ms-traffictypediagnostic: BL0PR08MB5377:
x-microsoft-antispam-prvs: <BL0PR08MB5377F8BD210415C8CAF88E81B8490@BL0PR08MB5377.namprd08.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zxxBnCNTJB2LBHaxXxtagZ5tue38r20iA/SD9PutrBfiQx894DzU/8s0Skv2L3Pn1si1DCfgxcgQuOa+D3/dBg/J/bb17/keXx+GH74RZ0URXq0V0xCt5OCjS+LL0g+f3POqu99YvE7HshhkMXSL1NABfCQUtRPSSfCjRbdrMEakYHp4wlf1b7T5V/D3zy/8IrLKoXKi10u/mJwJYeU/hX5iluGUURFt7f4JAB8wOQejoOEAaTp+pJ3mzkcF6UKL9/W5bUzHofUxmGfm0tkRqy61PgRPcw7SGuBX6cblVH38fkVFy0XYq9b/px7RfhJSs2LyXHNf4z/R7yfy3UceRw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR08MB6397.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(396003)(39860400002)(366004)(136003)(55016002)(54906003)(9686003)(66946007)(86362001)(52536014)(5660300002)(66446008)(66556008)(76116006)(64756008)(33656002)(71200400001)(316002)(7696005)(66476007)(26005)(6506007)(186003)(83380400001)(8676002)(2906002)(8936002)(4326008)(478600001)(6916009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: ROGGrd55jQPGa/zMi3QumC3P5r5yIYyaW+eb0wRm0wO3ujzH2uLEevmC2FLCyv8ejnVc/r9a4Ns20AuTFj/G1QmotKYnZPSNBHhMqSZvaLxS+jgq2KvFGu4JgiBVoh6huvLEyaMLErniqV7V+8bjsg9UMcURSpZFcQCRJJfaXPi7Rws3jrGZacSPNdON79zvx/gUnuqBdqm0K1UIdQ+JCNwWj9rYwtsKnJi+jhCtTviYt4cCho/HIJQm73gXhl/BMUCTFSCea96cKq3M8y73skn2SubYyfv5Pdjc3cz1nvUHvVjpBPbsI3SvYeF4rqBIs8mFIOt+k7ADpwS3g5HAWpDqd7LJiEgJy4NtT0yMstajjsVgtYkMH9JzTO9IhTPEGIPxml9J330VGjkYkKQbhqbPqa2WrnoCkNfDZwcf3E/tOGHwuP3tZYiE9GKiI8HWMXlwPEp2hSv2oZoR32SY05c67S2CKKV4NUhdCRnPNXHRFOlW5cJ5ZpMtNkIVainPVE3fRuTZhmrDwDsXixhwM6DhXwJ+vjZSkmDBm5PVZbgkcyN+OnPsC7gF5gJeMg9klPbhoBh0MXfE6UgE8tw6aAQYICMEaMB3jNWz3G/h4/usEG7QoWAkLlvCxOvf/KMvV7rVSINlak5iazsq27AvGA==
MIME-Version: 1.0
X-OriginatorOrg: micron.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR08MB6397.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78c3ad11-6286-45eb-8d42-08d83ad7a6e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2020 13:41:56.3584 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TOj1z1bCCk/2dXFFI7L44ZLwYpd/jOzA/fzDQw/xlm42YPx/oFv93n+/oH8X4NT3zfwa2V15wZxdboak8kTNcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR08MB5377
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200807_094159_305912_AFD8D9C3 
X-CRM114-Status: GOOD (  17.41  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Chuanhong Guo <gch981213@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Thirumalesha,

> 
> The MT29F2G01AAAED is a single die, 2Gb Micron SPI NAND Flash with 4-bit
> ECC
> 
> Signed-off-by: Thirumalesha Narasimhappa <nthirumalesha7@gmail.com>
> ---
>  drivers/mtd/nand/spi/micron.c | 77 +++++++++++++++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
> 
> diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
> index 5d370cfcdaaa..7e0b61d7b90f 100644
> --- a/drivers/mtd/nand/spi/micron.c
> +++ b/drivers/mtd/nand/spi/micron.c
> @@ -17,6 +17,7 @@
>  #define MICRON_STATUS_ECC_1TO3_BITFLIPS	(1 << 4)
>  #define MICRON_STATUS_ECC_4TO6_BITFLIPS	(3 << 4)
>  #define MICRON_STATUS_ECC_7TO8_BITFLIPS	(5 << 4)

It is better to add comment here, like

/* For Micron  MT29F2G01AAAED Device */

> +#define MICRON_STATUS_ECC_1TO4_BITFLIPS	(1 << 4)
> 
>  #define MICRON_CFG_CR			BIT(0)
> 
> @@ -44,6 +45,19 @@ static SPINAND_OP_VARIANTS(update_cache_variants,
>  		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
>  		SPINAND_PROG_LOAD(false, 0, NULL, 0));
> 
> +/* Micron  MT29F2G01AAAED Device */
> +static SPINAND_OP_VARIANTS(read_cache_variants_mt29f2g01aaaed,
> +		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
> +
> +static SPINAND_OP_VARIANTS(write_cache_variants_mt29f2g01aaaed,
> +		SPINAND_PROG_LOAD(true, 0, NULL, 0));
> +
> +static SPINAND_OP_VARIANTS(update_cache_variants_mt29f2g01aaaed,
> +		SPINAND_PROG_LOAD(false, 0, NULL, 0));
> +
>  static int micron_8_ooblayout_ecc(struct mtd_info *mtd, int section,
>  				  struct mtd_oob_region *region)
>  {
> @@ -69,11 +83,41 @@ static int micron_8_ooblayout_free(struct mtd_info
> *mtd, int section,
>  	return 0;
>  }
> 
> +static int mt29f2g01aaaed_ooblayout_ecc(struct mtd_info *mtd, int section,
> +					struct mtd_oob_region *region)
> +{
> +	if (section >= 4)
> +		return -ERANGE;
> +
> +	region->offset = (section * 16) + 8;
> +	region->length = 8;
> +
> +	return 0;
> +}
> +
> +static int mt29f2g01aaaed_ooblayout_free(struct mtd_info *mtd, int section,
> +					 struct mtd_oob_region *region)
> +{
> +	if (section >= 4)
> +		return -ERANGE;
> +
> +	/* Reserve 2 bytes for the BBM. */
> +	region->offset = (section * 16) + 2;
> +	region->length = 6;
> +
> +	return 0;
> +}
> +
>  static const struct mtd_ooblayout_ops micron_8_ooblayout = {
>  	.ecc = micron_8_ooblayout_ecc,
>  	.free = micron_8_ooblayout_free,
>  };
> 
> +static const struct mtd_ooblayout_ops mt29f2g01aaaed_ooblayout = {
> +	.ecc = mt29f2g01aaaed_ooblayout_ecc,
> +	.free = mt29f2g01aaaed_ooblayout_free,
> +};
> +
>  static int micron_select_target(struct spinand_device *spinand,
>  				unsigned int target)
>  {
> @@ -114,6 +158,27 @@ static int micron_8_ecc_get_status(struct
> spinand_device *spinand,
>  	return -EINVAL;
>  }
> 
> +static int mt29f2g01aaaed_ecc_get_status(struct spinand_device *spinand,
> +					 u8 status)
> +{
> +	switch (status & MICRON_STATUS_ECC_MASK) {
> +	case STATUS_ECC_NO_BITFLIPS:
> +		return 0;
> +
> +	case STATUS_ECC_UNCOR_ERROR:
> +		return -EBADMSG;
> +
> +	/* 1 to 4-bit error detected and corrected */
> +	case MICRON_STATUS_ECC_1TO4_BITFLIPS:
> +		return 4;
> +
> +	default:
> +		break;
> +	}
> +
> +	return -EINVAL;
> +}
> +
>  static const struct spinand_info micron_spinand_table[] = {
>  	/* M79A 2Gb 3.3V */
>  	SPINAND_INFO("MT29F2G01ABAGD",
> @@ -217,6 +282,18 @@ static const struct spinand_info
> micron_spinand_table[] = {
>  		     SPINAND_ECCINFO(&micron_8_ooblayout,
>  				     micron_8_ecc_get_status),
>  		     SPINAND_SELECT_TARGET(micron_select_target)),
> +	/* M70A 2Gb 3.3V */

This should be M69A.

> +	SPINAND_INFO("MT29F2G01AAAED",
> +
> SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x9F),
> +		     NAND_MEMORG(1, 2048, 256, 64, 2048, 80, 2, 1, 1),
> +		     NAND_ECCREQ(4, 512),
> +
> SPINAND_INFO_OP_VARIANTS(&read_cache_variants_mt29f2g01aaaed,
> +
> &write_cache_variants_mt29f2g01aaaed,
> +
> &update_cache_variants_mt29f2g01aaaed),
> +		     0,
> +		     SPINAND_ECCINFO(&mt29f2g01aaaed_ooblayout,
> +				     mt29f2g01aaaed_ecc_get_status),
> +		     SPINAND_SELECT_TARGET(micron_select_target)),

This device doesn't have multiple targets, you can remove micron_select_target.

>  };
> 
>  static int micron_spinand_init(struct spinand_device *spinand)
> --
> 2.17.1

Thanks,
Shiva

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
