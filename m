Return-Path: <SRS0=vJsE=D3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E9FFC433E7
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Oct 2020 08:49:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1097022282
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Oct 2020 08:49:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QeWu95o8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="q8gn83IP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1097022282
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:To:In-Reply-To:Date:Subject:Mime-Version:Message-Id:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7OZnrmXF/p3PgsXAT+jX2t32egweAN3cKrhpdaKg9WA=; b=QeWu95o87b6ZOXDm24s7wkMFb
	VxCCE91+JTbFXXBUPTIVJNGOXJLBpEprdO24V4Hdgh/HuhGM0ZSQE88EXiWL6+oO1sKJOKe6EHZk0
	UV3Wp/4nGVqVz6Flp8Ur1sVfNS5KX2w1Nkop8wLTyPnmMbiKlMTtdLHIwkYj9zBF/SN5h8wvE7BYL
	hfcpeQJnYcv49Xh2kAuw3nntdH3OpWE4snt7nLzb5gcsqk9C5UyFeniC/46mPcYV9fEpvx1447YPS
	mTMtY/wsydZjrLKOSfMGSvfgBv5trp4qfezFxYqqvnaPd7SDHEgdFBa2tsVrd/eV0zV9ZYv4bsBVj
	CWsaw8Ayw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUnJx-0001tG-Je; Tue, 20 Oct 2020 08:48:41 +0000
Received: from userp2120.oracle.com ([156.151.31.85])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUnJt-0001ra-59; Tue, 20 Oct 2020 08:48:38 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09K8i7rI188082;
 Tue, 20 Oct 2020 08:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : message-id :
 content-type : mime-version : subject : date : in-reply-to : cc : to :
 references; s=corp-2020-01-29;
 bh=UBSvDuZX45rcdCwz1yIzvCzCqfd2joSCizhea4x+Xao=;
 b=q8gn83IPPWdFm1HT3taLhd9DUF/VTUU+yXtsd8f9nD6wriupB19ul4FsqzWGdtIZMcde
 GW+G9oeRVHaGmJfZ8muagtVwvuWLE6AywXuhak+OXkSgdFP6EIR2H2OqKDUhR7yIW2Vz
 zpamQMFlTWRfwdWHBA7I0p8HYGgPlEg7NOi5pNpKeOCI5/Zqu82RI3DyvlSb3YeNhNvu
 1nAbi2LxPOnr/RtC4QoVHdNGHfdCdQB+x9xvmqx+BqjtbEr8lrxt1aMjIali/bjhTn7W
 dzqjxrXdOv4FjsFo2kwRKNjQX5RScYby9/qqSUitUFXIKeMy4YBvXYVTZYkhax1TMfnU 0w== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 347s8msmp0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 20 Oct 2020 08:48:12 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09K8is45150623;
 Tue, 20 Oct 2020 08:48:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3030.oracle.com with ESMTP id 348ahw07cp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 20 Oct 2020 08:48:12 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09K8mAEe159753;
 Tue, 20 Oct 2020 08:48:10 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 348ahw07bh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Oct 2020 08:48:10 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 09K8lvTX021447;
 Tue, 20 Oct 2020 08:47:58 GMT
Received: from [10.175.164.120] (/10.175.164.120)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 20 Oct 2020 01:47:57 -0700
From: John Haxby <john.haxby@oracle.com>
Message-Id: <27A23102-A7F5-48C5-8972-48CE4C283C6E@oracle.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [Ocfs2-devel] [RFC] treewide: cleanup unreachable breaks
Date: Tue, 20 Oct 2020 09:47:45 +0100
In-Reply-To: <CAKwvOdkR_Ttfo7_JKUiZFVqr=Uh=4b05KCPCSuzwk=zaWtA2_Q@mail.gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
References: <20201017160928.12698-1-trix@redhat.com>
 <20201018054332.GB593954@kroah.com>
 <CAKwvOdkR_Ttfo7_JKUiZFVqr=Uh=4b05KCPCSuzwk=zaWtA2_Q@mail.gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9779
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 phishscore=0 clxscore=1011 bulkscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010200059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_044837_331500_1B1A29D6 
X-CRM114-Status: GOOD (  19.20  )
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
Cc: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
 linux-iio@vger.kernel.org, Tom Rix <trix@redhat.com>,
 linux-pci@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 linux-stm32@st-md-mailman.stormreply.com, usb-storage@lists.one-eyed-alien.net,
 devel@driverdev.osuosl.org, linux-samsung-soc@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 linux-pm@vger.kernel.org, ath10k@lists.infradead.org,
 linux-acpi@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 industrypack-devel@lists.sourceforge.net, nouveau@lists.freedesktop.org,
 spice-devel@lists.freedesktop.org, MPT-FusionLinux.pdl@broadcom.com,
 linux-media@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-nfc@lists.01.org, linux-serial@vger.kernel.org,
 linux-can@vger.kernel.org, linux-block@vger.kernel.org,
 linux-gpio@vger.kernel.org, storagedev@microchip.com,
 linux-amlogic@lists.infradead.org, openipmi-developer@lists.sourceforge.net,
 platform-driver-x86@vger.kernel.org, bpf <bpf@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org,
 Greg KH <gregkh@linuxfoundation.org>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-security-module@vger.kernel.org,
 George Burgess <gbiv@google.com>, Network Development <netdev@vger.kernel.org>,
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>, linux-integrity@vger.kernel.org,
 patches@opensource.cirrus.com, ocfs2-devel@oss.oracle.com,
 linux-power@fi.rohmeurope.com
Content-Type: multipart/mixed; boundary="===============5223617819008618762=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5223617819008618762==
Content-Type: multipart/signed;
	boundary="Apple-Mail=_9F9749E9-79EA-41AB-B516-003ECE07BEE3";
	protocol="application/pgp-signature";
	micalg=pgp-sha256


--Apple-Mail=_9F9749E9-79EA-41AB-B516-003ECE07BEE3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 19 Oct 2020, at 20:42, Nick Desaulniers <ndesaulniers@google.com> =
wrote:
>=20
> We probably should add all 3 to W=3D2 builds (wrapped in cc-option).
> I've filed https://github.com/ClangBuiltLinux/linux/issues/1180 to
> follow up on.

It looks as though the URL mangling has been fixed.   If anyone sees =
that specific URL mangled, please let me know.

jch

--Apple-Mail=_9F9749E9-79EA-41AB-B516-003ECE07BEE3
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - http://gpgtools.org

iHUEAREIAB0WIQT+pxvb11CFWUkNSOVFC7t+lC+jyAUCX46kMQAKCRBFC7t+lC+j
yBKiAP90JVXdPzuAwtRGkROpw1eVCo7wCaZ5nOa8Oo0sN6gC9gD/S0eGTqQhmg+n
sXPJxPYqQsg09qmS6k/HX+AP5Oz2AMo=
=xx66
-----END PGP SIGNATURE-----

--Apple-Mail=_9F9749E9-79EA-41AB-B516-003ECE07BEE3--


--===============5223617819008618762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5223617819008618762==--

