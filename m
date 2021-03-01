Return-Path: <SRS0=zfSv=H7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC470C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Mar 2021 19:33:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BE5360231
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Mar 2021 19:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BE5360231
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YEIyRha5MVGLXAhbZdIbeMvwz6CrgHopD4bTRpX8ra0=; b=y9QSlx8XXgl/LEpD5d31OwIvcw
	Pcb2hCSqHw9JK/Pzh3TIeUI6JSBBBOeFI1oA+I6a4n7DO62TZBE312xKvlwJubkuIZ8dFucDqckg0
	NL/s6/vZngkCf999l8r2ErCQ7gLv2Te753PEV6cpoXM29H9Wt23+EwhMc/NI+0/MvUzkRaMPw2wOA
	BGfUUT2bl24xHKXeG21U+dKsQUownKju39cURvwPjfzIwJenvQT8pf2QC/oFgr36tPKIvBpx+Bns8
	jhro4EiC+S7NRxJzaWDaK0q4bRXBAbqqztp9gBNEcE0Jl+CHjY5ljmgq7N9B61xyoFsIwjFDZ5SHe
	PpM3ZTjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGoH6-0005cK-RP; Mon, 01 Mar 2021 19:32:12 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGoH3-0005bz-MP
 for linux-mtd@lists.infradead.org; Mon, 01 Mar 2021 19:32:11 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 121JW8vL057714
 for <linux-mtd@lists.infradead.org>; Mon, 1 Mar 2021 13:32:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1614627128;
 bh=0nS7eMRb7diGBAunNKc1UKHux6VBkOpy7Sd6CNpItE4=;
 h=Date:From:To:Subject;
 b=ynvbPR5kKoQcFUW3jgXAUBUxesCa9ZwN06iYGOp521suZ7mNI1ph7o7V0MH3MH5ts
 69W2Z8JPd2Ou6Z1NCjhQGO5QIPQ9OWJOGgRK0xjtGEGBFSctiHdv+s8ssvq7pfgSBJ
 bbx30OpRfyxKt6w0gCmYc7zLWJdV5FBMmf8Tkv1U=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 121JW8AP060426
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <linux-mtd@lists.infradead.org>; Mon, 1 Mar 2021 13:32:08 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 1 Mar
 2021 13:32:08 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 1 Mar 2021 13:32:08 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 121JW7n1013370
 for <linux-mtd@lists.infradead.org>; Mon, 1 Mar 2021 13:32:08 -0600
Date: Tue, 2 Mar 2021 01:02:07 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <linux-mtd@lists.infradead.org>
Subject: Fwd: Re: [PATCH 1/2] mtd: spi-nor: core: move Spansion SR ready
 codes out of core
Message-ID: <20210301193206.3ypatjxbmrmay6rj@ti.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="aopvt45sfvfxvvrs"
Content-Disposition: inline
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_143209_867930_C623A549 
X-CRM114-Status: GOOD (  23.08  )
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
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--aopvt45sfvfxvvrs
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

List admins,

I am getting this message (attachment) on every reply I send to this 
list recently. Can anything be done to block this address from the list?

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

--aopvt45sfvfxvvrs
Content-Type: message/rfc822
Content-Disposition: inline

Received: from DFLE103.ent.ti.com (10.64.6.24) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via Mailbox
 Transport; Mon, 1 Mar 2021 13:10:00 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 1 Mar
 2021 13:09:59 -0600
Received: from fllv0013.ext.ti.com (10.248.200.36) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Mon, 1 Mar 2021 13:09:59 -0600
Received: from mail6.bemta24.messagelabs.com (mail6.bemta24.messagelabs.com [67.219.250.44])
	by fllv0013.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 121J9rgU043120
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <p.yadav@ti.com>; Mon, 1 Mar 2021 13:09:59 -0600
Received: from [100.112.128.20] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.us-west-2.aws.symcld.net id E4/1C-42417-70C3D306; Mon, 01 Mar 2021 19:09:59 +0000
Authentication-Results: mx.messagelabs.com; spf=pass 
  (server-3.tower-322.messagelabs.com: domain of db.com designates 
  160.83.77.87 as permitted sender) smtp.mailfrom=db.com; dkim=pass (good 
  signature) header.i=@db.com header.s=20151124.db; dmarc=pass (p=none 
  sp=reject adkim=s aspf=r) header.from=db.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsWyINg3XJfNxjb
  B4Nx7G4u7z3+wOzB6HL+xnSmAMYo1My8pvyKBNWPlrWesBV2yFdc2WjQwLpfoYuTiYBG4zSLR
  29PBDuIICcxnkrg64yUrhDOPSeL0+cVMXYycQE47k8SzP2oQieuMEmfvL2YGSbAIaEmsePELq
  IiDg01AXKJnmxaIKSKgLPFlkwVIBa+AqsS3fVsZQWxOAVOJ3b+ngVULC4RJbFmfCVEiKHFy5h
  MWEJtZQF3iz7xLzBC2tsSyha/BbAmgibf2PASrYRSQkTg16QYbRFxS4vSrV+wTGAVnIRk1C8m
  oWUhGLWBkXsVokVSUmZ5RkpuYmaNraGCga2hopGtoZKFraG6pl1ilm6hXWqxbnlpcomukl1he
  rFdcmZuck6KXl1qyiREY1CkFDZt3MM5+80HvEKMkB5OSKO9bYdsEIb6k/JTKjMTijPii0pzU4
  kOMMhwcShK8W6yBcoJFqempFWmZOcAIg0lLcPAoifA6GQGleYsLEnOLM9MhUqcYFaXEeSdaAS
  UEQBIZpXlwbbCovsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmHcxyBSezLwSuOmvgBYzAS3
  eHmgFsrgkESEl1cA0+0qZa/MsVR/dlJ/rTXu9E5fcWc5+wrTM/mvndoeAhQ/aty8IdlxaMvHm
  jWV5u3SypVad67+Y6Zd6U336Aa0mc5+5fROe8331UHbZdjdH49LEYvUXM8P+bpZOk8v/mSK+o
  c225YYH27L7n/WWPBJetXXSH/Xed3EHr311N/Zm/eSh1hJoH3anfL6emF55uHTSoUdFgoEeNR
  HdOUkcXos3C/Kzpqmx8Lxy2fVZOPuypDOfzNvut2c8kk5P51gyxzflZ1zXuW6/L0HlKmf6tq4
  qsNBjYLze3lNqb+EkprOwI8LFNEhfQsFlk+vOkppkh64H8fvmFN8NWRG+Y8PuAzZmd9KXZkXe
  rdiso+T3SImlOCPRUIu5qDgRAGhVUWNlAwAA
X-Env-Sender: DB.NoReply@db.com
X-Msg-Ref: server-3.tower-322.messagelabs.com!1614625797!9784!1
X-Originating-IP: [160.83.77.87]
X-SpamReason: No, hits=0.0 required=7.0 tests=newsletters: 
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 875 invoked from network); 1 Mar 2021 19:09:58 -0000
Received: from nyginzxmfappp2.us.db.com (HELO nyginzxmfappp2.us.db.com) (160.83.77.87)
  by server-3.tower-322.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 1 Mar 2021 19:09:58 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=db.com; h=date : from : to :
 message-id : in-reply-to : subject : mime-version : content-type :
 content-transfer-encoding; s=20151124.db;
 bh=afiOsvNIsgbkX9xvBN1loS7p23KIp7/L0T9W7J6TA+o=;
 b=hELQNisQD8SJNTuucXkYFZgClw+3YmeD+qkZ2pcRo6sjYhqpkkx/hvGSNdDYF8GrkEP4
 5CJJjN92pCoyRd/GOsnItS80498AB+80QFxLLAa1Fdg5I5hdtATXyohMcD+THcz17yNV
 La1qoPpMbXC54JMb8/Q1KoE3JSDidwIS6kF2fxkYkPjyG8NhzcWD3jVj+JswF+Nw71Yu
 0YOVQbH6XQMn/YHQu1I+89vCAGHaSdpGCrS8WM9Fp8JQrtKxCBvBM3vcapS2oRKq3sSc
 J1o2be4jOy6Hfz/5WWT9vTB7xXtj5UcXNZo67VeQTqnfO2NoS0JGHwSVDW0rgmg4dwfU hA== 
Received: from nyjinmrappb2.us.db.com (nyjinmrappb2.us.db.com [10.213.59.32])
	by nyginzxmfappp2-adm.us.db.com (8.16.0.43/8.16.0.43) with ESMTPS id 121J9vJ7013123
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <p.yadav@ti.com>; Mon, 1 Mar 2021 19:09:57 GMT
Received: from nygingmrp2.us.db.com (nygingmrp2.us.db.com [10.164.88.44])
	by nyjinmrappb2.us.db.com (Sentrion-MTA-4.5.4/Sentrion-MTA-4.5.4) with ESMTPS id 121J9u9u010361
	(version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=OK)
	for <p.yadav@ti.com>; Mon, 1 Mar 2021 19:09:56 GMT
Received: from frainmailp30.de.db.com (frainmailp30.de.db.com [10.216.2.80])
	by nygingmrp2.us.db.com (8.15.2/8.14.8) with ESMTPS id 121J9sg0008620
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <p.yadav@ti.com>; Mon, 1 Mar 2021 14:09:56 -0500
Received: from dbkpsgdg01.rze.de.db.com (dbkpsgdg01.rze.de.db.com [10.222.152.142])
	by frainmailp30.de.db.com (8.15.2/8.14.8) with ESMTP id 121J7rr7004923
	for <p.yadav@ti.com>; Mon, 1 Mar 2021 20:09:54 +0100 (MET)
Date: Mon, 1 Mar 2021 20:09:53 +0100
From: <DB.NoReply@db.com>
To: Pratyush Yadav <p.yadav@ti.com>
Message-ID: <0002BaG3SCEC6BCJ@db.com>
In-Reply-To: <20210301190829.foqbaroznavsf7ka@ti.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: core: move Spansion SR ready codes
 out of core
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Genesys E-Mail 8.5.104.30
Auto-Submitted: auto-replied
X-Loop: DB.NoReply@db.com
Return-Path: DB.NoReply@db.com
X-MS-Exchange-Organization-Network-Message-Id: 88b24039-e26d-4021-3586-08d8dce59c2a
X-MS-Exchange-Organization-AuthSource: DFLE101.ent.ti.com
X-MS-Exchange-Organization-AuthAs: Internal
X-MS-Exchange-Organization-AuthMechanism: 10
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MS-Exchange-Transport-EndToEndLatency: 00:00:00.3801935
X-MS-Exchange-Processed-By-BccFoldering: 15.01.1979.002
MIME-Version: 1.0
X-TUID: MDp+DlplWk3k

___________________________________________________________________________=
________________________

Note: This is an automatically generated email
                Replies are neither read nor processed
                Please always send inquiries / questions to the following a=
ddress: online.service@db.com

___________________________________________________________________________=
_________________________

Thank you very much for your inquiry.

We hereby confirm the receipt of your email and will reply as soon as possi=
ble.

However, please understand that in some instances this may take longer than=
 expected.

Please note that we are unable to process or to reply to any account-relate=
d requests submitted via e-mail.

Therefore we kindly ask you to please send us your request/inquiry formally=
 via one of the following secure channels:

- if you use Telephone Banking, call us at +49 69 910 10000, 24/7 (English =
assistance: 8 a.m. to 10 p.m. CET, Mondays to Fridays),
- if you use Online Banking, please enter your PIN and a TAN and select "Se=
rvices" -> "Further Services" -> "Contact and Channels" -> "Send Message to=
 the Bank"=20
- or simply send a letter, duly signed, by regular mail to:

               Deutsche Bank AG
               Kundenservice
               04024 Leipzig
               Germany

This is an automatically generated email, please do not reply.

Kind regards,
Deutsche Bank

We are always there for you:

- via fax: +49 69 910-10001
- via e-mail: For questions, information about our products and for your fe=
edback, please contact us at: deutsche-bank.de/kontakt
- via mail: Write to us in case of questions, information about our product=
s as well as for your feedback at: Deutsche Bank AG, Kundenservice, 04024 L=
eipzig, Germany
- via your branch: Surely we are also nearby. You can easily find us at:  d=
eutsche-bank.de/filiale
- via Facebook: facebook.com/DeutscheBankAG
- via Twitter: twitter.com/DeutscheBankAG

The European Commission has established a European online dispute resolutio=
n platform (OS platform) under http://ec.europa.eu/consumers/odr/. Consumer=
s may use the OS platform to resolve disputes arising from online contracts=
 with providers established in the EU.

Please refer to https://www.db.com/disclosures for information (including m=
andatory corporate particulars) on selected Deutsche Bank branches and grou=
p companies registered or incorporated in the European Union. This e-mail m=
ay contain confidential and/or privileged information. If you are not the i=
ntended recipient (or have received this e-mail in error) please notify the=
 sender immediately and delete this e-mail. Any unauthorized copying, discl=
osure or distribution of the material in this e-mail is strictly forbidden.

Die Europ=C3=A4ische Kommission hat unter http://ec.europa.eu/consumers/odr=
/ eine Europ=C3=A4ische Online-Streitbeilegungsplattform (OS-Plattform) err=
ichtet. Verbraucher k=C3=B6nnen die OS-Plattform f=C3=BCr die au=C3=9Ferger=
ichtliche Beilegung von Streitigkeiten aus Online-Vertr=C3=A4gen mit in der=
 EU niedergelassenen Unternehmen nutzen.

Informationen (einschlie=C3=9Flich Pflichtangaben) zu einzelnen, innerhalb =
der EU t=C3=A4tigen Gesellschaften und Zweigniederlassungen des Konzerns De=
utsche Bank finden Sie unter https://www.deutsche-bank.de/Pflichtangaben. D=
iese E-Mail enth=C3=A4lt vertrauliche und/ oder rechtlich gesch=C3=BCtzte I=
nformationen. Wenn Sie nicht der richtige Adressat sind oder diese E-Mail i=
rrt=C3=BCmlich erhalten haben, informieren Sie bitte sofort den Absender un=
d vernichten Sie diese E-Mail. Das unerlaubte Kopieren sowie die unbefugte =
Weitergabe dieser E-Mail ist nicht gestattet.

--aopvt45sfvfxvvrs
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--aopvt45sfvfxvvrs--

