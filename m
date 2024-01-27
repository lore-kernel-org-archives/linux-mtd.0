Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6254C46CD2
	for <linux-mtd@archiver.kernel.org>; Sat, 27 Jan 2024 07:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9NTASaUs4L9CWT9umN/eYZnfF71amV4LgLaYu9vq06w=; b=t/+CTnZkGSi/1J
	nV/rVYRXvuGZUTv319+LrLo2Wnd30Tk4Pwj0RgU8kSWk14EBD1yDxmaxHs+gGL7svtdQCyTMfZrSf
	+WdZgBLe83qJrHzJi0fp7uuyWwMVFnPcHanObtYwiO+2KUdw0MFN2DVU+61xn556plhH9jF96qjOZ
	FjnnpeXDz3z7mq4xuUyP6DFklTYwg5IM/yEscKHbpSAV1wAGQQf/XBwauxP2JEmH4KJLBKbVFmj6w
	Ya26k8JTv4FnCVmD1+qhFLYIi2wlFhYn6DHXl5LS7EoLwafSYCAN9nP0beI0crwPcox6M9HGGRYKs
	3zYlOtaqCAHeH9XxBY3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTdFn-000000076RL-3hYz;
	Sat, 27 Jan 2024 07:37:27 +0000
Received: from mail-sy4aus01olkn20801.outbound.protection.outlook.com ([2a01:111:f403:2819::801] helo=AUS01-SY4-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTdFk-000000076Qo-2f4z
	for linux-mtd@lists.infradead.org;
	Sat, 27 Jan 2024 07:37:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=id8au8aY9y/ctIsi06uB1tjrWS5AfCGo+jPhRThHAk3n0rar+A2h4ly4fhcryLNCVuJ/qo0ntaJ8C3P1VJTkgSpyUCScg/3wXqNH5ycXkpsdKGzu4KscgKgkqQ8QsR/SB/msPidFnt/wii/taHmpAlnUpWf6ifBfJZlekdR37BMQa7+iCGAIzHbeqiUSPlqUPcFkJfFDtpAKJJcPaYUJt89Ts1nPgdfu9fBNcoN60CrdHNu7Ns8SHgIk6i6Qmm1K/cwj9lPHjreFTdNvQ4H9CSYIk5ZPsSgzDcV8fJSplXPUs78SnC03wdkkQ+yJJHs+EE2ZpmgU/IjePE2xTAg68Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fLQrT/dQVnyV5FjE4iDUyiUJE4/aTHMxlHEifyqVQ10=;
 b=TYEkdNiQODEEQQinvwKYtDaupMby9ZF/LiqphTYrpcp34xNgUZU/DqQ9cuMKb+iAl+xdtj4ahWLbSMEHks4D7jkPcAW67Nwt6k0fdBc3IVNOkSebdZ5rxGHd4FtbHNTe73OAtCH32SDjFjzfeCVIYCBc+IeewtGsDH/bIBd9vt/QKf2ju2m0QNX0VycxC3h/C8xVJtlSwqK+LWWATpUmrCPego6jYJnX8TyrlrMzkGyeHgi8BM5dveUsIiChGlCmlDM5OgoBulZKbLMT76xqrCaM/RxhqhV5I0+mbSIFb58qY8sK4H84RPF87/HvnyTGMdVuk4Qcq1J4Tkfeu3+OKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLQrT/dQVnyV5FjE4iDUyiUJE4/aTHMxlHEifyqVQ10=;
 b=TUu5d+GK6J0UG2B6iK4EP1akH9AbNKuGVQwT8mAekRCWp/jpdN7sDh64A17DCPlTUUpbq5GuWZDobldNjs6yUmuZOcxX+LsAWiKeOqnNIJ5n4l/pPqjYGC/6DtaeXCBZ8Y9vxmDuiG+tAycRUzT2QcPQaBH0ra9rUlgL/9htGOg97bYWOPTmpsOlIvlc0Ujy1EjMtNhPGcYS6Hcirje6ZZNLZUdMaCr7GXKO5vy+gEunwN+Vk07b6+eyowogMWdzrQKEJBwRVgpOZYfd8tasabbziJgFAI0c4+tlRkK3m3KE7lCT25tFT6KJf6zuKzl+xDVQrHusQI8QSR6/BhYimg==
Received: from MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:159::11)
 by SYYP282MB1743.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:79::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.28; Sat, 27 Jan
 2024 07:21:21 +0000
Received: from MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM
 ([fe80::5c9c:492c:49ad:813a]) by MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM
 ([fe80::5c9c:492c:49ad:813a%6]) with mapi id 15.20.7228.029; Sat, 27 Jan 2024
 07:21:21 +0000
From: Ryder Wang <rydercoding@hotmail.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Subject: Re: ubifs: master area fails to recover when master node 1 is
 corrupted
Thread-Topic: ubifs: master area fails to recover when master node 1 is
 corrupted
Thread-Index: AQHaT3/4KFNTQ257tUeGc3qFkxFol7DrXWgAgAHiTsI=
Date: Sat, 27 Jan 2024 07:21:20 +0000
Message-ID: <MEYP282MB3164A9167C34C14EAC15663ABF782@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
References: <MEYP282MB3164FE84067710E5AC8D34A9BF7A2@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
 <45ef54d1-582b-e6a8-f8f7-291f9b4c98c4@huawei.com>
In-Reply-To: <45ef54d1-582b-e6a8-f8f7-291f9b4c98c4@huawei.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-tmn: [DCaH4X7P5CD0KS03CNPvN6zSWHZNMaw9]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MEYP282MB3164:EE_|SYYP282MB1743:EE_
x-ms-office365-filtering-correlation-id: d4b3676c-1172-4715-1c23-08dc1f088f87
x-ms-exchange-slblob-mailprops: 8U9+OAG/EBL4si3D7xEfkCZHGQ5hCGUBploZLolb20SJbt3o7+j/AwmE31lqAp19xoFSBSNoi82h0+t03aPrIGakJqq8UkQZ6f/QnYyxoZ7LSm7/QQnDyrdsXn9iLu4DNEioKlDvdvWv8PmKOsUcEHphTEwyo0pG1ufs77bO59b3S7c4Rd525nCOCuKoS2cAg0/TDmGaThpIcadCFYjcTL5hryLMIVfveOaXdZYBmv0G0KVv7DtjbJKr2Dj++fkBfurqIGfiSrlr6YzzIYHcqFZzkfyMPDpXiARu8VtXJ3Qu9Dq9t3u7/obdzArLEgK2erjs2crRmkn9xoW2jLeDKBy2PJGeozdxvLNpfIIIs8LJtF7BQUSCMUv1ljTB7JA0wENwbbBNXDODy5wWRvs4GIRGl3qI8HMkqWyvAe5oWZO5ClqXJc5xzVcN0lT2fiRUO+JvkaRsIxOOZlJAgk0DETVW+c2yNVY77hx+8vGawdBbH5a1a5JebJU8rhzpqFgo9+uD7pLWGHug/qDFWVnSfxYKZwzQoY8Z3xAqgBWO0sjSYMNwxlPuD7RQ8ulnN1viQBzNPCQv9fXc2jPoOgqNitzb7fWrw0PpdsphY8XQqNYzdxz+hv4O+glIo4CscwVZbEojCOY4eN10D9/RI8PZRTSYtCKJD+Ku3BBG61Xo9Gaub8ZUwYDTWwcui3ggc00Z82WNWj4hQ64Jk0FPp0wfWZW0+LeITNcaJatjjPyRnvCh4GyDu77pLHM8M9JJfNWxYlXKFCNSxdEdKAHjW/8fWGlHd0jLhQXs9UVLiBSYzLhadOG56HuYPdrgve+qE1qjBcJYoZrT5jrXnZhVIOH5Xg==
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dQuSSrNFX1gOpArx/Kvdk1zSOoGUVRVXTF/MnmxEtoSkgEuPJJHDiljMTa178xEQzE4V+p5llQ35CQmSrFKbGf8k84vtH6493OHmPpNMqGa8KYupJMV1qSeuGG46p4K/rAMteXwQuBFg9samiHlipoJS4tYv3swS8AM/zdQRkuexMVJKa3dzu4+Xvyagzr567iAzUEWIhKm9i5yGt+266TEx2TbUqayxbrMO4DUmkcu0qe8omsRjUlIYcsNyq8ldwyESzpORIKoJeNAbGaQrUFQtcaLmOIGsHDwDj7GocEeyIpCNS3QXuODCJiv+nNJbx4SaFO4SfLfyaCSsDLFe0u3Q4btbiZV3siLsaayUOl0et/1idppiZQoH+hh2yeOR51enJWE8em/cWNW1TydjjnqUVX0EGWVVVRrmJ3NcAtiZI/VH/QSKeFXfySS4TaEYulk03V8IJM/0Wux9/Q8fXYkm0o0RYpuIunU8S0FuElYxqjWucIgN5HAxEj4yXu/t9Yq5qCBjC393SJdpQp6s0eAVxqhsQuVey+2+t2uXweGGRM6QypRLx0eOm/r3eM1cQatAvTThzyHGJgUXmchURpSlSw0G2QMJzw3lrPtkOXQ=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?OVhuM3BjRGxISFc0T2pGK3lDQmNpZWtjbDhFWUxjb2RrV09pa1gyZ3Jk?=
 =?iso-2022-jp?B?eG5vd09lY2dTUTJBeXd6aDBETmhOM25RNEJUVG90ZzhFRVdRSGQ5eUFo?=
 =?iso-2022-jp?B?VDJFRDRXQnNrOUF4Wi8zdXEzaGNZTGZHM0N6Ujd0QmlQSHY0TURJTXdU?=
 =?iso-2022-jp?B?bUVYYlJTQVdrY2lVa2xQeHpyU05BSDJtVDVDR3pvdysraHNXb0NGUG5Q?=
 =?iso-2022-jp?B?NTRCcFpXUDAwcGw2cFAzU1NwY3VEeWxmaTBUWThFMjQySWhCVStiTnJK?=
 =?iso-2022-jp?B?Z05xSG1md1JPejltbEJ2MjJLTEZyK3cyWmRWbmNCOTJzMGUvT3FFNVpF?=
 =?iso-2022-jp?B?R21vV1JLNjdCVnBqcTcwanVvUWZiaThWVzYyWFhmUHZOL0htVFY2NVFB?=
 =?iso-2022-jp?B?QWdrNTlFMytDRGRVcS9jdy8wZnc3UmV5MGRDWklod0M2ekhwUlFCL2t4?=
 =?iso-2022-jp?B?Q2F6bHVTSUx1Q0duTlI0bDdOd3VuNnR3ZlFzc3Zud3ZoeGFCOTBxT1ZN?=
 =?iso-2022-jp?B?NWpaeEJSTEtjRk9sOVlZbW84ZTFEMTBmMlNEQlVTSk9xa2tZdzhqalRV?=
 =?iso-2022-jp?B?R0JySnU0S2laM3FjUmFxVHIrOE5MY09USGdWSWlpTTk0UTYwOFRiZnY2?=
 =?iso-2022-jp?B?RFBSTDR0QkxkMkVKV2NMV3czaG43bXJlUjdRK1gzOHlwMWc1bVNoV01h?=
 =?iso-2022-jp?B?dGFXcS9jQ3A1RmRNNTBtclZuTlNaMEJRTVNiMDNUM1VUSTVrVnQ2dXdX?=
 =?iso-2022-jp?B?bS8vTFRsZ2xPQXJHRHFSc3VGS0hHbGxsL2o5TFVnaXZPc0JDTXNKVEpM?=
 =?iso-2022-jp?B?Um9wTXpDdlh5OUtDMWRDSlM4czhpa3BQVFg2c2k1V1R2UXZqaXVzM0k3?=
 =?iso-2022-jp?B?aEtMTUJUMEpMNkJQQnBEVWFxQXNMSWlhaWFEWThRK3NiUGdzU0k0TDYx?=
 =?iso-2022-jp?B?MVFtQ1Fob3RiTEdHWkJtaklRY1lleUJYSXFVeGJDZE9jYkdKczFrSEJE?=
 =?iso-2022-jp?B?UXJuYTRWVGV3azRRc1k4K3AzZ2NLMEdJT1Y3c3A4T1VuMXZkMVZLalBs?=
 =?iso-2022-jp?B?UVQwU2lhbmZhN25JemRPTzlrOTBhdXZwaTArTjJEdGoxTk1xbEtaWElq?=
 =?iso-2022-jp?B?cksxVzJYdE5hQm5ZVzl6NjZJcXdvMDlVZEt6a3VZeVZ3UXdPL1BUSVFo?=
 =?iso-2022-jp?B?T0lQWkg1MGhVZWRDTS9tMEVCU1UzUmVsUGN0aTBISHZUOEhsQjA4ci9k?=
 =?iso-2022-jp?B?aHZVd0FiNGphYjFxVVY4Q1Q4YXV1cmlFSjM4Z3ZwTG9SSlZ1VWIvZ01F?=
 =?iso-2022-jp?B?MDZ5TTFXbU5TRS8rbU01eXVVQkdiUU8vUVdWa280QkN0VWMwenNaeGtk?=
 =?iso-2022-jp?B?aHZHbWRJUGtaZ0g0ZUFneTVLczZWdWpiNzFiN3RaZ0R2dzlrUTVxS0t3?=
 =?iso-2022-jp?B?cU5VL1ppanpUUWc0dkg0NnVWb2EzcXc1R0ZHVzIraVN4Qld3S0sraWVZ?=
 =?iso-2022-jp?B?ZWVRcktIY3NXZ3JuYXU1RWVDRy8yQUFaUzBPMXpOSnMvNlV4cHVkUXBN?=
 =?iso-2022-jp?B?cVJjckdNM0VVUEhwS0dzQ2x3c3NsNlVDWndCS3FNcUtpUmQ4U1NIUjlK?=
 =?iso-2022-jp?B?MXRFdzduZmVYcXJIQjRMbzFMRUlKZlZGN2hnRDN5WHl3anJrVG45YktL?=
 =?iso-2022-jp?B?UGtsREtob3pwUXpyWkYzcFRteGdLTlFOTk5jOTNlNmw3RzR2WVAxWEU4?=
 =?iso-2022-jp?B?dGpqeW05aHZCWUFRYWYydjFUY3c9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-746f3.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d4b3676c-1172-4715-1c23-08dc1f088f87
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2024 07:21:20.7737
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYYP282MB1743
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_233724_899412_EB99BDDB 
X-CRM114-Status: GOOD (  21.22  )
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
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Zhihao,

Your explanation is very professional. Thanks for it.

But I still have a doubt about the code logic:
------------------------------------
  if (mst1) // false
  else {
   offs2 = (void *)mst2 - buf2;  // offs2 = 0
   if (offs2 + sz + sz <= c->leb_size) // true, mst2 is the first node in LEB 2
     goto out_err
  }
------------------------------------
1. My testing result just proved that CRC-corrupted master#1 also runs to "else" clause of the code above, just like master#1 is unmapped.
2. For CRC corrupted master#1 case, the code logic looks inconsistent:
  2.1. If master#2 LEB is just to be full, master#2 will be used to recover master area.
  2.2. If master#2 LEB is not to be full, master recovering will be aborted with error.

I think whether master#2 LEB is to be full has nothing to do with whether to recover master area in such case. How do you think about it?
________________________________________
From: Zhihao Cheng <chengzhihao1@huawei.com>
Sent: Friday, January 26, 2024 10:20
To: Ryder Wang; linux-mtd@lists.infradead.org
Subject: Re: ubifs: master area fails to recover when master node 1 is corrupted

在 2024/1/25 19:48, Ryder Wang 写道:
> Hi,
>
> I just find that master area will always fail to recover while mounting, when master node 1's CRC is corrupted but master node 2 is completely good.  It can be 100% reproduced on Kernel v5.4.233, but it seems a common issue.
>

According to the debug messages below, the mounting failure occurs as
follows:
                     LEB 1                       LEB 2
           |mst1 | 0xFF 0xFF ... |      |mst2 | 0xFF 0xFF ... |
offset    0                            0
* mst1 has bad crc.

ubifs_recover_master_node
  get_master_node(UBIFS_MST_LNUM, &mst1)
   ubifs_scan_a_node(buf, lnum, offs=0) // SCANNED_A_CORRUPT_NODE
    ubifs_check_node  // -EUCLEAN, caused by bad crc
   if (offs < c->leb_size) // true
    if (!is_empty(buf, min_t(int, len, sz))) // true
     dbg_rcvry("found corruption at %d:%d")
  get_master_node(UBIFS_MST_LNUM + 1, &buf2, &mst2)
   ubifs_scan_a_node // SCANNED_A_NODE
   *mst = buf // buf = sbuf
   buf2 = sbuf
  if (mst1) // false
  else {
   offs2 = (void *)mst2 - buf2;  // offs2 = 0
   if (offs2 + sz + sz <= c->leb_size) // true, mst2 is the first node
in LEB 2
     goto out_err
  }

Above process is one situation recovering master nodes after powercut,
which means that LEB 1 is unmapped and ready to be written the newest
master node, then powercut happens:
ubifs_write_master
  lnum = UBIFS_MST_LNUM; // LEB 1
  if (offs + UBIFS_MST_NODE_SZ > c->leb_size) // true
   err = ubifs_leb_unmap(c, lnum);
  >> powercut <<
  err = ubifs_write_node_hmac(c->mst_node, lnum)
So master node from LEB 2 can only be recovered in condition that there
is no room left for new master nodes in LEB 2.
Now, the problem is that we corrupt mst1 to construct this situation,
UBIFS identifies that the fact is not the expected situation, UBIFS
refuses to recover master nodes.

> How to reproduce it:
> 1. Corrupt the CRC value of master node 1 (keep master node 2 is good) on ubifs.
> 2. Mount this ubifs.
>
> Mount at step#2 will always fail. From the log, it looks master recovering fails, but master recovering is expected to be OK in such case.

Master node is not expected to be OK in this situation. These two master
nodes are not used to recovery in any situations, they are used to find
a valid version of master node. You can refer to following section in [1]:

"The master node stores the position of all on-flash structures ... The
first is that there could be a loss of power at the same instant that
the master node is being written. The second is that there could be
degradation or corruption of the flash media itself. ... In the second
case, recovery is not possible because it cannot be determined reliably
what is a valid master node version."

[1] http://linux-mtd.infradead.org/doc/ubifs_whitepaper.pdf

>
> Below is the kernel log of this failure:
>
> ubifs_mount:2253: UBIFS DBG gen (pid 10770): name ubi0:test_volume, flags 0x0
> ubifs_mount:2274: UBIFS DBG gen (pid 10770): opened ubi0_0
> ubifs_read_node:1094: UBIFS DBG io (pid 10770): LEB 0:0, superblock node, length 4096
> UBIFS (ubi0:0): Mounting in unauthenticated mode
> ubifs_read_superblock:765: UBIFS DBG mnt (pid 10770): Auto resizing from 13 LEBs to 100 LEBs
> ubifs_start_scan:131: UBIFS DBG scan (pid 10770): scan LEB 1:0
> ubifs_scan:270: UBIFS DBG scan (pid 10770): look at LEB 1:0 (253952 bytes left)
> ubifs_scan_a_node:77: UBIFS DBG scan (pid 10770): scanning master node at LEB 1:0
> UBIFS error (ubi0:0 pid 10770): ubifs_scan [ubifs]: bad node
> ubifs_recover_master_node:234: UBIFS DBG rcvry (pid 10770): recovery
> ubifs_scan_a_node:77: UBIFS DBG scan (pid 10770): scanning master node at LEB 1:0
> get_master_node:163: UBIFS DBG rcvry (pid 10770): found corruption at 1:0
> ubifs_scan_a_node:77: UBIFS DBG scan (pid 10770): scanning master node at LEB 2:0
> get_master_node:152: UBIFS DBG rcvry (pid 10770): found a master node at 2:0
> UBIFS error (ubi0:0 pid 10770): ubifs_recover_master_node [ubifs]: failed to recover master node
> UBIFS error (ubi0:0 pid 10770): ubifs_recover_master_node [ubifs]: dumping second master node
> UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, PID 10772
>          magic          0x6101831
>          crc            0x3a5c03b2
>          node_type      7 (master node)
>          group_type     0 (no node group)
>          sqnum          9
>          len            512
>          highest_inum   65
>          commit number  0
>          flags          0x2
>          log_lnum       3
>          root_lnum      12
>          root_offs      0
>          root_len       108
>          gc_lnum        11
>          ihead_lnum     12
>          ihead_offs     4096
>          index_size     112
>          lpt_lnum       7
>          lpt_offs       44
>          nhead_lnum     7
>          nhead_offs     4096
>          ltab_lnum      7
>          ltab_offs      57
>          lsave_lnum     0
>          lsave_offs     0
>          lscan_lnum     10
>          leb_cnt        13
>          empty_lebs     1
>          idx_lebs       1
>          total_free     753664
>          total_dirty    7640
>          total_used     440
>          total_dead     0
>          total_dark     16384
> UBIFS (ubi0:0): background thread "ubifs_bgt0_0" stops
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> .
>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
